# 🚀 CUDA Hardware Acceleration & RTL Architecture Benchmarks

An open-source digital design, parallel arithmetic, and low-level system simulation logging workspace tracking high-performance GPGPU acceleration pipelines, structural RTL design blocks, and silicon-level execution optimizations.

---

## ⚡ System Infrastructure & Sandbox Metrics

| System / Stack Layer | Native Toolchain Specification | Low-Level Engineering Purpose |
| :--- | :--- | :--- |
| **Compute Core Hardware** | NVIDIA Dedicated GeForce GPU | Physical target for parallel SIMT thread mapping |
| **Parallel Driver Engine** | CUDA Toolkit Release 13.4 (V13.4.92) | Primary acceleration wrapper for hardware block scheduling |
| **RTL Compiler Suite** | Icarus Verilog (`iverilog` v12 Stable) | Native compilation backend for structural hardware blocks |
| **RTL Runtime Engine** | `vvp` Simulation Runtime Architecture | Testbench synthesis and binary verification runner |
| **Waveform Analyzer** | GTKWave Electronic Design Viewer | Digital timing track validation and signal transition analysis |
| **Runtime Interpreter** | Standalone Python 3.12.2 Workspace | Environment for managing high-level matrix allocation paths |

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

### 🔹 Lab 03: SIMT Warp Divergence & Silicon Performance Profiler
* **Objective:** Profile execution serialization overheads inside a 32-thread hardware Warp execution block.
* **Architectural Flow:** Compares interleaved conditional logic (`idx % 2 == 0`) with warp-aligned blocks (`(idx / 32) % 2 == 0`) to guarantee execution pathways execute uniform instructions across the thread scheduler.
* **Instrumentation:** Uses native sub-millisecond GPU hardware event trackers (`cuda.Event`) to monitor execution times.
* **Directory Workspace:** [`/03_warp_divergence_analysis`](./03_warp_divergence_analysis)

### 🔹 Lab 04: Multi-Stage Computer Arithmetic Arrays (Booth Multiplier)
* **Objective:** Deploy signed hardware multiplication routines that reduce partial product aggregation steps.
* **Architectural Flow:** Implements a 4-Bit Radix-2 Booth Multiplier core utilizing sequential state processing logic, 2's complement subtraction steps, and hardware-level arithmetic right shifts (ARS) to preserve signed bits during operation.
* **Directory Workspace:** [`/04_multi_stage_multiplier`](./04_multi_stage_multiplier)

---

## 🧪 Verification & Simulation Trace Outputs

### 📊 1. Structural RTL ALU Simulation Log (`vvp alu_sim.vvp`)
```text
Time     A       B       Opcode          Result          CarryOut
------------------------------------------------------------
20000    0101 ( 5)       0011 ( 3)       00 (ADD)        1000 ( 8)       0
30000    1100 (12)       0110 ( 6)       00 (ADD)        0010 ( 2)       1
40000    0101 ( 5)       0011 ( 3)       10 (AND)        0001 ( 1)       0
```
* **Hardware Analysis:** At timestamp `30000`, a binary arithmetic overflow occurs (12 + 6 = 18). The 4-bit unsigned register wraps and correctly trips the **`CarryOut = 1` hardware flag**, validating true gate-level computer arithmetic execution.

### 📊 2. Multi-Stage Signed Booth Multiplier Log (`vvp multiplier_sim.vvp`)
```text
Time     Multiplicand (M)        Multiplier (Q)          Product (Signed Decimal)
-------------------------------------------------------------------------
20000    0011 ( 3)               0010 ( 2)               00000110 (   6)
30000    1100 (-4)               0011 ( 3)               11110100 ( -12)
40000    1110 (-2)               1101 (-3)               00000110 (   6)
```
* **Hardware Analysis:** At timestamp `30000`, the hardware handles an initial negative number multiplication (-4 × 3). It generates a perfect sign-extended 8-bit output of `11110100 (-12)`. At `40000`, it successfully resolves a double-negative product (-2 × -3) to resolve a positive decimal value of `6`.

---

## 🧠 Environmental Debugging & Troubleshooting Log

* **The Compiler Integration Block:** Bypassed an `nvcc preprocessing failure (cl.exe failed with exit code 2)` caused by missing terminal environment pathways. Resolved by executing a localized runtime injection, mapping the exact Visual Studio Build Tools binary address (`..\VC\Tools\MSVC\14.51.36231\bin\HostX86\x64`) straight into the active system path environment variable array.
* **The Symbol Parsing Mismatch:** Resolved a structural library compilation crash (`TypeError: unsupported operand type(s) for |`) triggered by syntax conflicts between modern PyCUDA libraries and legacy background Python engines. Resolved by migrating the entire project runtime stack onto an isolated, standalone Python 3.12 architecture running precompiled binary wheel bundles cleanly.

---

## 🔬 Core Hardware Engineering Competencies

This continuous validation playground documents hands-on exposure to practical silicon engineering, embedded firmware control, and systems design:

### 📐 Physical System Design, Embedded Control & Technical Leadership
* **System Design & ECAD Workflows:** Experience with Cadence and KiCad ECAD suites for trace routing and DRC track width enforcement, alongside 3D mechanical modeling via Autodesk.
* **Embedded Control & Mechatronics:** Practical background in developing Cartesian control loops for multi-axis robotic gantry frameworks and hardware debugging.
* **Project & Operations Management:** Leadership roles including Project NexWatt student lead for renewable energy storage and institutional chapter treasurer.
