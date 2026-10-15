# 🧬 NVIDIA Warp Divergence & Performance Benchmarking Log

This lab project profiles how conditional code pathways branch at the physical silicon layer inside an **NVIDIA Streaming Multiprocessor (SM)**.

---

## 🧠 Architectural Deep Dive: What is a Warp?
In NVIDIA GPU architecture, execution units do not handle individual threads independently. Instead, the hardware groups threads into bundles of **32 parallel threads**, known as a **Warp**. 

A warp operates under the **SIMT (Single Instruction, Multiple Threads)** model. This means all 32 hardware threads inside a single warp must execute the exact same assembly instruction at the exact same clock cycle.

### 🔴 The Warp Divergence Problem (Interleaved Branching)
If your hardware kernel contains conditional blocks (`if/else`) where even threads take one path and odd threads take another, a hardware conflict occurs:
```text
Warp Threads [00-31] ──► │ IF Branch (Even Cores Run / Odd Cores Stalled)  │ ◄── Cycle 1
                         │ ELSE Branch (Odd Cores Run / Even Cores Stalled) │ ◄── Cycle 2
```
Because a single warp cannot run two different instructions simultaneously, the hardware is forced to **serialize** the execution. It disables half the cores, runs the `if` block, then swaps and runs the `else` block. This cuts your execution throughput directly in half.

### 🟢 The Architectural Fix (Warp-Aligned Blocks)
By changing the conditional logic from `idx % 2 == 0` to `(idx / 32) % 2 == 0`, we group threads into contiguous blocks of 32. This ensures that every single thread inside a physical warp takes the exact same branch pathway, allowing the hardware execution units to run at **100% parallel efficiency**.

---

## 📊 Benchmark Configuration & Implementation Details
* **Workload Dimensions:** 8,000,000 Floating-Point Elements
* **Thread Block Geometry:** 256 Threads/Block | 31,250 Total Blocks
* **Precision Profiling Instrumentation:** Native GPU Hardware Event Tracks (`cuda.Event`)
* **Source Workbench Code:** [`warp_profile.py`](./warp_profile.py)
