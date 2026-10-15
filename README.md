# 🚀 Advanced Parallel Computing, RTL Design & Robotics Engineering Log

> **A centralized, multi-disciplinary systems portfolio tracking high-performance GPGPU acceleration pipelines, structural RTL circuits, automated digital signal processing (DSP) hardware verification, and physical mechatronics control networks.**

---

## ⚡ Technical Infrastructure & System Toolchain
* **Hardware Platform:** Local Host Architecture running physical NVIDIA Dedicated Core Compute Engines.
* **HDL & Logic Simulation:** Icarus Verilog (`iverilog` v12) + `vvp` simulation runtime + GTKWave Waveform Viewer.
* **Mathematical Synthesis & Data Tracking:** MATLAB R2026a Framework + Python 3.12.2 (PyCUDA + `gpuarray`).
* **Physical Prototyping & CAD Engines:** SolidWorks 3D Modeling Suite, Autodesk Inventor, and Fusion 360.

---

## 🗃️ Active Engineering Laboratory Modules

### 🔹 Lab 01: SIMT Vector Arithmetic Scaling Engine
* **Core Architecture:** Maps high-density data matrices across parallel GPU threads, completely bypassing sequential CPU host processing loop latency.
* **Data Flow:** Offloads memory allocations directly to dedicated VRAM blocks using unified `gpuarray` streams.
* **Workspace Link:** [`/01_vector_addition`](./01_vector_addition)

### 🔹 Lab 02: 4-Bit Structural Arithmetic Logic Unit (ALU)
* **Core Architecture:** Implements a gate-level structural Ripple-Carry Adder alongside a parallel array of bitwise logic circuits managed by an operational 4-to-1 routing control multiplexer (Opcode Decoder).
* **Workspace Link:** [`/02_hardware_alu_design`](./02_hardware_alu_design)

### 🔹 Lab 03: SIMT Warp Divergence Profiler
* **Core Architecture:** Evaluates performance penalties within a 32-thread hardware Warp scheduler. Compares interleaved conditionals (`idx % 2 == 0`) with warp-aligned processing blocks (`(idx / 32) % 2 == 0`).
* **Instrumentation:** Leverages sub-millisecond, on-chip native GPU hardware event timers (`cuda.Event`).
* **Workspace Link:** [`/03_warp_divergence_analysis`](./03_warp_divergence_analysis)

### 🔹 Lab 04: Signed Computer Arithmetic Array (Booth Multiplier)
* **Core Architecture:** A 4-Bit Signed Radix-2 Booth Multiplier core utilizing sequential state processing logic, 2's complement subtraction steps, and hardware-level arithmetic right shifts (ARS) to preserve sign bits.
* **Workspace Link:** [`/04_multi_stage_multiplier`](./04_multi_stage_multiplier)

### 🔹 Lab 05: CMOS Silicon Cell Schematic Interface
* **Core Architecture:** Full-custom circuit synthesis capturing transistor-level pull-up and pull-down configurations natively inside the Electric VLSI Design System.
* **Workspace Link:** [`/05_vlsi_asic_layout`](./05_vlsi_asic_layout)

### 🔹 Lab 06: Automated DSP Filter Pipeline Verification (Verilog + MATLAB)
* **Core Architecture:** A 3-Tap Signed Finite Impulse Response (FIR) Filter Engine built using structural data delay pipeline registers and arithmetic Multiply-Accumulate (MAC) circuitry streams.
* **Cross-Tool Verification:** Uses an automated **MATLAB** mathematical emulation script (`verify_filter.m`) to trace internal hardware register shifts on each clock transition, exporting a matrix of golden test vectors to validate the Verilog logic.
* **Workspace Link:** [`/06_dsp_filter_pipeline`](./06_dsp_filter_pipeline)

---

## 🔬 Core Field Competencies & Practical Domain Experience

### 📐 1. Computer Architecture, VLSI Design & Circuits
* **Transistor-Level Engineering:** Applied basic circuit mechanics and CMOS transistor topologies to design green energy control systems, custom power tracking nets, and logic gates using series/parallel pull networks.
* **Hardware Language Proficiency:** Confident in writing, compiling, and testing structural **Verilog HDL** code. (Understands that **VHDL** is structurally similar in purpose for hardware design, but follows a much more verbose, strongly typed syntax model).

### 🤖 2. Mechatronics, Computer Vision & Robotics Layouts
* **Plant Surgery Robot Manipulation Network:** (Undergraduate Researcher, SUROE Lab, University of Georgia). Co-designed a mobile-base automated automation system. Personally engineered the **3-Axis Cartesian robotic system block** from scratch.
* **Hardware Integration:** Managed component procurement, component order mapping, physical schematic signal wiring, and microcontroller integration to run multi-axis stepper motor driver control networks on physical shop floors.
* **Physical CAD Prototyping:** Utilized **SolidWorks**, **Autodesk Inventor**, and **Fusion 360** to draft 3D structural models, mechanical enclosures, assembly links, and custom introductory engineering robot car chassis arrays.

### 🧠 3. Artificial Intelligence, Machine Learning & Project Management
* **Advanced AI Software Engineering (CodePath AI 301):** Active student engineer managing machine learning codebases, handling complex repository version controls, mapping architectural model pipelines, tracking codebase bugs, and routing issue queues via GitHub.
* **Vision & Robotic Models (Vanderbilt AI Intensive):** Trained in modern AI model architectures. Analyzed specific domain capabilities, parameter weights, and mechanical execution profiles for advanced **Vision-Language-Action (VLA) robotics models** and biological laboratory data automation configurations.

---

## 🧠 Environmental Troubleshooting & Problem-Solving Ledger

* **The Compiler Integration Block:** Bypassed an `nvcc preprocessing failure (cl.exe failed with exit code 2)` caused by missing terminal environment pathways. Resolved by executing a localized runtime injection, mapping the exact Visual Studio Build Tools binary address (`..\VC\Tools\MSVC\14.51.36231\bin\HostX86\x64`) straight into the active system path environment variable array.
* **The Symbol Parsing Mismatch:** Resolved a structural library compilation crash (`TypeError: unsupported operand type(s) for |`) triggered by syntax conflicts between modern PyCUDA libraries and legacy background Python engines. Resolved by migrating the entire project runtime stack onto an isolated, standalone Python 3.12 architecture running precompiled binary wheel bundles cleanly.
