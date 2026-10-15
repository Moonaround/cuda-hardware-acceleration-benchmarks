# 🚀 CUDA Hardware Acceleration & SIMT Architecture Benchmarks

A continuous engineering and optimization workspace documenting hands-on execution, hardware debugging, and performance profiling running natively on **NVIDIA GPU Silicon**.

---

## 🔬 Core Objectives & Proof of Work
This standalone repository serves as active, practical proof of my experience utilizing the **NVIDIA CUDA Toolkit** to accelerate mathematical and architectural workloads. The goal of this portfolio is to track my transition from basic parallel programming into deep, low-level microarchitecture optimizations.

### Current Technical Proficiencies Demonstrated:
* **SIMT Execution Model:** Mapping software workloads to physical Single Instruction, Multiple Threads (SIMT) logic loops.
* **Memory Management:** Managing automated Host-to-Device data blocks across PCIe lanes using unified `gpuarray` abstractions.
* **Native Toolchain Configuration:** Integrating the NVIDIA CUDA Compiler (`nvcc`) directly with local **Microsoft Visual Studio Build Tools / MSVC** pipelines on Windows.

---

## 🗃️ Active Implementations & Benchmarks

### 🔹 Lab 01: 1-Million Element SIMT Vector Addition
* **Objective:** Establish native toolchain paths and evaluate baseline parallel scheduling metrics.
* **Architectural Blueprint:** Bypassed traditional sequential CPU `for` loops by launching a parallelized elementwise kernel across thousands of independent physical hardware threads simultaneously.
* **Status:** Verified and functional on local NVIDIA consumer silicon.
* **Source:** [`gpu_test.py`](./gpu_test.py)

---

## 🗺️ Long-Term Development Roadmap (Making it Deeper)

To prepare for advanced systems and hardware architecture concepts, I am actively expanding this repository into the following phases:

* [x] **Phase 1: Environment & Baseline Verification** — Successful deployment of native toolchain, compiler linking, and vector scaling.
* [ ] **Phase 2: Matrix Multiplication & Memory Hierarchy Optimization** — Moving past global memory (VRAM) bounds by writing custom kernels that tile data onto high-speed on-chip **Shared Memory (SRAM)** blocks to minimize latency.
* [ ] **Phase 3: Warp Divergence Analyses** — Designing kernels to study how hardware threads group into groups of 32 (**Warps**), benchmarking execution stalls caused by nested conditional logic (`if/else` paths).
* [ ] **Phase 4: Multi-Threaded Latency Hiding Profiles** — Profiling occupancy configurations to maximize thread execution blocks per Streaming Multiprocessor (SM).

---

## 🧠 Environmental Troubleshooting Log
* **Resolved MSVC Toolchain Pathing Constraints:** Diagnosed a preprocessor failure (`cl.exe failed with exit code 2`) during runtime compilation. Resolved the block by dynamically injecting the exact host-to-device toolchain path wrapper (`..\MSVC\14.51.36231\bin\HostX86\x64`) straight into the Python system path environment variable.

---

## 🏃‍♂️ Verification Console Output
```bash
> py gpu_test.py

🚀 SUCCESS! Your Acer Nitro 5 GPU calculated 1,000,000 additions in parallel!
```
