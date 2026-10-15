import os
import sys

# 1. Direct Python to your native Visual Studio Build Tools compiler
msvc_bin_path = r'C:\Program Files\Microsoft Visual Studio\18\Insiders\VC\Tools\MSVC\14.51.36231\bin\HostX86\x64'
if os.path.exists(msvc_bin_path):
    os.environ['PATH'] = msvc_bin_path + os.pathsep + os.environ['PATH']

import numpy as np
import pycuda.autoinit
import pycuda.driver as cuda
import pycuda.gpuarray as gpuarray
from pycuda.elementwise import ElementwiseKernel

# 2. Define the hardware kernel instructions using C++ syntax
gpu_vector_add = ElementwiseKernel(
    "float *d_a, float *d_b, float *d_c",
    "d_c[i] = d_a[i] + d_b[i]",
    "vector_add_kernel"
)

# 3. Generate 1,000,000 elements to calculate on the host (CPU)
N = 1000000
host_a = np.random.randn(N).astype(np.float32)
host_b = np.random.randn(N).astype(np.float32)

# 4. Use gpuarray to cleanly allocate memory and copy data directly to GPU VRAM
# This bypasses the 'DeviceAllocation' bug entirely!
device_a = gpuarray.to_gpu(host_a)
device_b = gpuarray.to_gpu(host_b)
device_c = gpuarray.empty_like(device_a)

# 5. Trigger parallel hardware execution across processing blocks
gpu_vector_add(device_a, device_b, device_c)

# 6. Fetch the calculated solution matrix back into CPU workspace
host_c = device_c.get()

# 7. Verify processing accuracy and print result
if np.allclose(host_c, host_a + host_b):
    print("\n🚀 SUCCESS! Your Acer Nitro 5 GPU calculated 1,000,000 additions in parallel!")
else:
    print("\n❌ Hardware evaluation mismatch.")
