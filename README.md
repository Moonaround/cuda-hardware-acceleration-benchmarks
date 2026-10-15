# 🚀 CUDA Hardware Acceleration & RTL Architecture Benchmarks

An open-source digital design and parallel computing log focused on GPGPU acceleration frameworks, CMOS circuits, and low-level arithmetic system optimizations.

---

## ⚡ The Project Sandbox Metrics

| Metric / Stack Component | Hardware / Software Specification Target | Real-World Engineering Purpose |
| :--- | :--- | :--- |
| **Compute Core engine** | NVIDIA GeForce Dedicated GPU | Physical target for SIMT parallel thread scaling |
| **RTL Compiler Suite** | Icarus Verilog (`iverilog v12`) + `vvp` runtime | Native structural compilation and testbench synthesis |
| **Logic Waveform Engine** | GTKWave Electronic Waveform Viewer | Visual debugging of timing tracks and circuit state changes |
| **Language Framework** | Verilog HDL (Structural) + Python 3.12 (PyCUDA) | Cross-layer development bridging hardware and runtime software |

---

## 🗃️ Active Lab Implementations

### 🔹 Lab 01: SIMT Vector Arithmetic Scaling Engine
* **Objective:** Map massive data streams across parallel pipelines to benchmark global memory limits.
* **Architectural Flow:** Bypasses sequential host CPU loops by explicitly offloading data matrices across high-speed PCIe channels directly onto dedicated GPU VRAM using `gpuarray`. 
* **Benchmark Output:** Processed **1,000,000 parallel additions instantly** on physical silicon hardware blocks.
* **Directory Workspace:** [`/01_vector_addition`](./01_vector_addition)

### 🔹 Lab 02: 4-Bit Structural Arithmetic Logic Unit (ALU)
* **Objective:** Synthesize a functional ALU core down to explicit logic gates, multiplexers, and transistor pulling paths.
* **Architectural Flow:** Implements a hardware-level Ripple-Carry Adder and parallel bitwise logical arrays (`AND`/`OR`) managed by an operational 4-to-1 routing control multiplexer (Opcode Decoder).
* **Validation Run:** Verified via an automated testbench tracking continuous binary calculations and overflow flags.
* **Directory Workspace:** [`/02_hardware_alu_design`](./02_hardware_alu_design)

---

## 🧪 Real-World Verification & Output Validation Log

### 1. Hardware Vector Addition Run (`py gpu_test.py`)
```bash
Time     A       B       Opcode          Result          CarryOut
------------------------------------------------------------
20000    0101 ( 5)       0011 ( 3)       00 (ADD)        1000 ( 8)       0
30000    1100 (12)       0110 ( 6)       00 (ADD)        0010 ( 2)       1
```
* **Hardware Insight:** At timestamp `30000`, a binary arithmetic overflow occurs (\(12 + 6 = 18\)). The 4-bit unsigned register safely clips the matrix block and trips the **`CarryOut = 1` hardware flag**, proving accurate computer arithmetic handling.

---

## 🧠 Engineering Changelog & Environmental Troubleshooting

### 🔧 Resolving Environmental Preprocessor Constraints
* **The Problem:** The NVIDIA background compilation driver (`nvcc`) threw a fatal preprocessing error (`cl.exe failed with exit code 2`) because it could not locate the underlying Microsoft Visual Studio environment variables.
* **The Architectural Fix:** Dynamically mapped and injected the exact host-to-device compilation toolchain directory string (`..\VC\Tools\MSVC\14.51.36231\bin\HostX86\x64`) directly into the active system path array wrapper at runtime.

### 🔧 Resolving Library Type Mismatches
* **The Problem:** PyCUDA source builds threw a `TypeError` due to a symbol parsing mismatch (`|` type hints) running inside legacy background Python compiler nodes.
* **The Architectural Fix:** Migrated the local system environment onto an isolated standalone Python 3.12 architecture stack to interface with pre-compiled stable binary wheels cleanly.

---

## 🗺️ Project Development Roadmap
* [x] **Phase 1: GPGPU Framework Setup** — Toolchain deployment and SIMT verification loop.
* [x] **Phase 2: Gate-Level RTL Design** — Structural 4-bit ALU core design with full behavioral testbench validation.
* [ ] **Phase 3: Silicon-Level CMOS Layout** — Performance profiling of PMOS and NMOS transistor width configurations.
