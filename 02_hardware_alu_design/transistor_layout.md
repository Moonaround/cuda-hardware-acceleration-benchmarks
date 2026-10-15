# 🔬 CMOS Transistor-Level Circuit Implementations

This document supplements the structural Verilog ALU design by mapping the digital logic functions directly onto physical Complementary Metal-Oxide-Semiconductor (CMOS) transistor networks. 

---

## 🎛️ 1. The Core Inverter (NOT Gate)
The foundation of CMOS logic. It uses exactly one PMOS transistor in the Pull-Up Network (PUN) and one NMOS transistor in the Pull-Down Network (PDN).

### 📐 Circuit Schematic Topology
```text
          Vdd (Power)
           │
       ┌───┴───┐
       │      _│_  PMOS (Pull-Up)
  In ──┴─────┤   │
             └───┤
                 ├─────── Out
             ┌───┤
       ┌─────┤_  │ NMOS (Pull-Down)
       │       │ │
       └───┬───┘
           │
          GND (Ground)
```

---

## 🛑 2. The 2-Input NAND Gate
In VLSI layout design, NAND gates are preferred over AND gates because they require fewer manufacturing stages and exhibit lower propagation delay on silicon.

### 📐 Circuit Schematic Topology
* **Pull-Up Network (PUN):** Two PMOS transistors connected in **Parallel**.
* **Pull-Down Network (PDN):** Two NMOS transistors connected in **Series**.

```text
               Vdd (Power)
                │
        ┌───────┴───────┐
        │               │
       _│_             _│_
  A ──┤   │       B ──┤   │  (PMOS Parallel Array)
      └───┤           └───┤
          └───────┬───────┘
                  │
                  ├─────────── Out
                  │
                 _│_
            A ──┤   │        (NMOS Series Stack)
                └───┤
                    │
                   _│_
              B ──┤   │
                  └───┤
                      │
                     GND
```

---

## ⚡ 3. Realizing the ALU Bitwise Circuits
To build the bitwise `AND` logic mapped out in our structural hardware design file (`alu_core.v`), the silicon layout combines the two networks above:

\[\text{AND}(A, B) = \text{NOT}(\text{NAND}(A, B))\]

By feeding the output of our 4-transistor NAND circuit directly into a 2-transistor Inverter circuit, we create a highly optimized **6-Transistor Bitwise AND Block** ready for Very Large Scale Integration (VLSI).
