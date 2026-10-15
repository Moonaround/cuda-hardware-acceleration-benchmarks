# 🚀 CUDA Hardware Acceleration & RTL Architecture Benchmarks

> **An open-source digital design, parallel arithmetic, and low-level system simulation log dedicated to validating custom GPGPU acceleration pipelines and structural RTL execution cores.**

---

## 🔬 Core Contribution Philosophy

This repository operates as a public, rigorous engineering laboratory notebook tracking progression from GPU acceleration software abstractions down to gate-level microarchitecture boundaries. 

### Why Maintain This Lab?
* **Zero AI-Slop Design Tolerance:** Every line of code, simulation artifact, and structural layout represents deterministic human configuration, physical toolchain compilation, and low-level hardware validation [explicit_memory_claims: 22, 23, 24].
* **Rigorous Verification Contracts:** Code changes are never pushed blindly. Every optimization must match a physical testbench baseline with explicit execution traces, binary validation data, or electrical waveforms [explicit_memory_claims: 247].
* **Transparent System logs:** Real hardware engineering is defined by fixing system integration breaks. This environment maps explicit environmental error logs alongside the precise low-level compiler path injections used to bypass them.

---

## ⚡ The Project Infrastructure & Toolchain Target

All computational pipelines, hardware descriptions, and benchmarking simulations are executed and profiled locally on physical consumer silicon:

| System / Stack Layer | Native Toolchain Specification | Low-Level Engineering Purpose |
| :--- | :--- | :--- |
| **Compute Core Hardware** | NVIDIA Dedicated GeForce GPU | Physical silicon target for parallel SIMT thread mapping |
| **Parallel Driver Engine** | CUDA Toolkit Release 13.4 (V13.4.92) | Primary acceleration wrapper for hardware block scheduling |
| **RTL Compiler Suite** | Icarus Verilog (`iverilog` v12 Stable) | Native compilation backend for structural hardware blocks |
| **RTL Runtime Engine** | `vvp` Simulation Runtime Architecture | Testbench synthesis and binary verification runner |
| **Waveform Analyzer** | GTKWave Electronic Design Viewer | Digital timing track validation and signal transition analysis |
| **Runtime Interpreter** | Standalone Python 3.12.2 Workspace | Environment for managing high-level matrix allocation paths |

---

## 🗃️ Lab Module Directory Boundaries

The repository framework strictly isolates processing tracks into dedicated laboratory quadrants. Each directory contains individual execution blocks and targeted verification files:

```text
cuba/
├── 01_vector_addition/           # Quadrant 01: Host/Device GPGPU Abstrations
│   └── gpu_test.py               # Memory offloading and parallel verification core
├── 02_hardware_alu_design/       # Quadrant 02: Structural RTL Synthesis
│   ├── alu_core.v                # Structural gate-level ALU processor model
│   ├── alu_tb.v                  # Verification testbench and arithmetic checks
│   ├── architecture_schematic.md # Modular 4-to-1 multiplexer routing diagram
│   └── transistor_layout.md      # CMOS PMOS/NMOS pull-up/pull-down mappings
└── 03_warp_divergence_analysis/  # Quadrant 03: SIMT Microarchitecture Profiling
    ├── warp_profile.py           # High-precision hardware event timing benchmark
    └── warp_analysis.md          # Analysis of serialization overheads on silicon
```

---

## 📐 Strict Data Contract & Verification Rules

To maintain production-grade system integrity across this repository, any future expansion must strictly adhere to the following data contracts:

### 1. The GPGPU Vector Allocation Rule (`/01_vector_addition`)
* Memory allocation loops must utilize unified `gpuarray` formatting templates to automate Host-to-Device memory mapping across internal PCIe channels. 
* Hardware scripts must output an explicit verification state matrix checking calculated values against a baseline CPU equivalent using deterministic math checks (`np.allclose`).

### 2. The Gate-Level RTL Structural Rule (`/02_hardware_alu_design`)
* Custom ALU operations must be handled using structural design definitions mapped onto explicit logic gates, ripple-carry addition lines, and data-path steering networks.
* Behavioral models inside design wrappers must match an active verification testbench tracking discrete timescales, binary vectors, and arithmetic carry/overflow output flags:
```text
Time     A       B       Opcode          Result          CarryOut
------------------------------------------------------------
20000    0101 ( 5)       0011 ( 3)       00 (ADD)        1000 ( 8)       0
30000    1100 (12)       0110 ( 6)       00 (ADD)        0010 ( 2)       1
```

### 3. The SIMT Warp Alignment Rule (`/03_warp_divergence_analysis`)
* Timing benchmarks must never rely on high-latency host CPU python execution clocks (`time.time()`).
* Performance optimization metrics are strictly required to use native, sub-millisecond GPU hardware event trackers (`cuda.Event`) to capture processing deltas directly on the execution silicon.

---

## 🧠 Environmental Debugging & Troubleshooting Log

Real systems development involves overcoming environmental constraints. This workspace registers the exact debugging solutions utilized during core environment synthesis:

* **The Compiler Integration Block:** Bypassed an `nvcc preprocessing failure (cl.exe failed with exit code 2)` caused by missing terminal environment pathways. Resolved by executing a localized runtime injection, mapping the exact Visual Studio Build Tools binary address (`..\MSVC\14.51.36231\bin\HostX86\x64`) straight into the active system path environment variable array.
* **The Symbol Parsing Mismatch:** Resolved a structural library compilation crash (`TypeError: unsupported operand type(s) for |`) triggered by syntax conflicts between modern PyCUDA libraries and legacy background Python engines. Resolved by migrating the entire project runtime stack onto an isolated, standalone Python 3.12 architecture running precompiled binary wheel bundles cleanly.

---

## 🗺️ Project Development Roadmap
* [x] **Phase 1: GPGPU Toolchain Validation** — Local path injection, native `nvcc` configuration, and SIMT vector scaling.
* [x] **Phase 2: Structural Gate-Level RTL Design** — Synthesis of 4-bit processor ALU, testbench truth validation, and CMOS pulling network maps.
* [x] **Phase 3: SIMT Profiling & Core Analysis** — Hardware event-driven warp divergence benchmarking and serialization tracing.
* [ ] **Phase 4: Multi-Stage Computer Arithmetic Arrays** — Designing a low-level structural Wallace Tree or Booth Multiplier circuit block.
