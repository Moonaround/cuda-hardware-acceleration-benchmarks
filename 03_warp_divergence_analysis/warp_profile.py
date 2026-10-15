import os
import time
import numpy as np

# Link your Visual Studio Build Tools compiler paths automatically
msvc_bin_path = r'C:\Program Files\Microsoft Visual Studio\18\Insiders\VC\Tools\MSVC\14.51.36231\bin\HostX86\x64'
if os.path.exists(msvc_bin_path):
    os.environ['PATH'] = msvc_bin_path + os.pathsep + os.environ['PATH']

import pycuda.autoinit
import pycuda.driver as cuda
import pycuda.gpuarray as gpuarray
from pycuda.compiler import SourceModule

# 1. HARDWARE INSIGHT: Define raw CUDA C++ kernels to study thread grouping
# Kernel A: Causes heavy Warp Divergence using interleaved conditional branches
# Kernel B: Optimized to align uniform execution pathways within the 32-thread warp
kernel_code = """
__global__ void divergent_kernel(float *d_out, float *d_in, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        // Interleaved branch: Even/Odd thread indices take opposite hardware paths.
        // Since a warp consists of 32 sequential threads, this completely splits the warp execution unit!
        if (idx % 2 == 0) {
            d_out[idx] = d_in[idx] * 2.0f + 5.0f;
        } else {
            d_out[idx] = d_in[idx] * 3.0f - 1.0f;
        }
    }
}

__global__ void optimized_kernel(float *d_out, float *d_in, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        // Optimized branch: Threads take uniform paths in contiguous blocks of 32.
        // This ensures entire physical warps execute the same instruction path simultaneously.
        if ((idx / 32) % 2 == 0) {
            d_out[idx] = d_in[idx] * 2.0f + 5.0f;
        } else {
            d_out[idx] = d_in[idx] * 3.0f - 1.0f;
        }
    }
}
"""

# Compile the raw hardware kernels natively
mod = SourceModule(kernel_code)
divergent_fn = mod.get_function("divergent_kernel")
optimized_fn = mod.get_function("optimized_kernel")

# 2. Setup large vector bounds (8 Million elements)
N = 8000000
host_in = np.random.randn(N).astype(np.float32)

# Copy data arrays directly onto your Acer Nitro 5 GPU's VRAM
device_in = gpuarray.to_gpu(host_in)
device_out_div = gpuarray.empty_like(device_in)
device_out_opt = gpuarray.empty_like(device_in)

# Configure CUDA block geometry matching typical streaming multiprocessor allocations
threads_per_block = 256
blocks_per_grid = (N + threads_per_block - 1) // threads_per_block

print("🚀 Benchmarking NVIDIA Silicon Warp Profiles...")
print(f"Elements: {N} | Threads/Block: {threads_per_block} | Blocks: {blocks_per_grid}\\n")

# 3. Profile the Divergent Kernel (High Silicon Overhead)
start_time = time.time()
divergent_fn(device_out_div, device_in, np.int32(N), block=(threads_per_block, 1, 1), grid=(blocks_per_grid, 1))
cuda.Context.synchronize()
divergent_duration = time.time() - start_time
print(f"🔴 Divergent Kernel Time: {divergent_duration * 1000:.3f} ms")

# 4. Profile the Optimized Kernel (Uniform Warp Execution)
start_time = time.time()
optimized_fn(device_out_opt, device_in, np.int32(N), block=(threads_per_block, 1, 1), grid=(blocks_per_grid, 1))
cuda.Context.synchronize()
optimized_duration = time.time() - start_time
print(f"🟢 Optimized Kernel Time: {optimized_duration * 1000:.3f} ms")

# Calculate and display speedup metrics
speedup = (divergent_duration / optimized_duration) if optimized_duration > 0 else 1.0
print(f"\\n📈 Hardware Speedup via Warp Alignment: {speedup:.2f}x faster execution!")
