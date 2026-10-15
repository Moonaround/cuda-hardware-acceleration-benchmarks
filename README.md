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
* **Directory Workspace:** [`/01_vector_addition`](./01_vector_addition)

### 🔹 Lab 02: 4-Bit Structural Arithmetic Logic Unit (ALU)
* **Objective:** Synthesize a functional ALU core down to explicit logic gates, multiplexers, and transistor pulling paths.
* **Directory Workspace:** [`/02_hardware_alu_design`](./02_hardware_alu_design)

### 🔹 Lab 03: SIMT Warp Divergence & Silicon Performance Profiler
* **Objective:** Profile execution serialization overheads inside a 32-thread hardware Warp execution block using native `cuda.Event` metrics.
* **Directory Workspace:** [`/03_warp_divergence_analysis`](./03_warp_divergence_analysis)

### 🔹 Lab 04: Multi-Stage Computer Arithmetic Arrays (Booth Multiplier)
* **Objective:** Deploy signed hardware multiplication routines utilizing sequential logic and arithmetic right shifts (ARS).
* **Directory Workspace:** [`/04_multi_stage_multiplier`](./04_multi_stage_multiplier)

### 🔹 Lab 05: Open-Source ASIC Physical Design Flow Automation
* **Objective:** Automate RTL-to-GDSII physical synthesis pipelines to transform structural logic gates into verified silicon layouts.
* **Architectural Flow:** Emulates the **OpenLane & SkyWater 130nm PDK** toolchain pipeline. Executes logic synthesis, cell floorplanning, clock tree synthesis (CTS), and multi-layer copper grid routing, verifying layout profiles via automated design rule checking (DRC).
* **Directory Workspace:** [`/05_vlsi_asic_layout`](./05_vlsi_asic_layout)

---

## 🔬 Core Hardware Engineering Competencies

This continuous validation playground documents hands-on exposure to practical silicon engineering, embedded firmware control, and systems design:

### 📐 Physical System Design, Embedded Control & Technical Leadership
* **System Design & ECAD Workflows:** Experience with Cadence and KiCad ECAD suites for trace routing and DRC track width enforcement, alongside 3D mechanical modeling via Autodesk.
* **Embedded Control & Mechatronics:** Practical background in developing Cartesian control loops for multi-axis robotic gantry frameworks and hardware debugging.
* **Project & Operations Management:** Leadership roles including Project NexWatt student lead for renewable energy storage and institutional chapter treasurer.

---

### 🏃‍♂️ Git Terminal Commands:
```bash
cd C:\Users\japja\Desktop\gpu\cuba
git add .
git commit -m "Phase 5 Complete: Deploy automated ASIC physical design synthesis flow layout and update master project profile"
git push origin main
```
