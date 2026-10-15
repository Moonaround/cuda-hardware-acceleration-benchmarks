# 🗺️ Hardware Architecture Block Diagram

This block diagram models how data signals and control vectors route natively through the 4-Bit Arithmetic Logic Unit execution stages on silicon.

```mermaid
flowchart TD
    %% Define Styles and Colors for a clean theme
    classDef inputs fill:#2d3748,stroke:#4a5568,stroke-width:2px,color:#fff;
    classDef control fill:#742a2a,stroke:#9b2c2c,stroke-width:2px,color:#fff;
    classDef logic fill:#1a365d,stroke:#2b6cb0,stroke-width:2px,color:#fff;
    classDef outputs fill:#1c4532,stroke:#2f855a,stroke-width:2px,color:#fff;

    %% Hardware Input Pins
    subcontractor_A["input wire [3:0] A"]:::inputs
    subcontractor_B["input wire [3:0] B"]:::inputs
    control_Op["input wire [1:0] Opcode"]:::control

    %% Parallel Processing Circuits
    subgraph Execution_Blocks [Streaming Execution Blocks]
        style Execution_Blocks fill:#1a202c,stroke:#4a5568,stroke-width:1px,color:#fff
        block_ADD[4-Bit Ripple Carry Adder]:::logic
        block_SUB[4-Bit Subtractor Unit]:::logic
        block_AND[Bitwise AND Gate Array]:::logic
        block_OR[Bitwise OR Gate Array]:::logic
    end

    %% Bus Routing Systems
    mux_Select{4-to-1 Control Multiplexer}:::control

    %% Hardware Output Pins
    pin_Result["output reg [3:0] ALU_Result"]:::outputs
    pin_Carry[output reg CarryOut]:::outputs

    %% Signal Pathways Connections
    subcontractor_A --> block_ADD
    subcontractor_A --> block_SUB
    subcontractor_A --> block_AND
    subcontractor_A --> block_OR

    subcontractor_B --> block_ADD
    subcontractor_B --> block_SUB
    subcontractor_B --> block_AND
    subcontractor_B --> block_OR

    %% Routing Outputs into the Mux
    block_ADD -->|Sum + Carry| mux_Select
    block_SUB -->|Difference| mux_Select
    block_AND -->|Logical AND| mux_Select
    block_OR  -->|Logical OR|  mux_Select

    %% Control Lines
    control_Op -->|Select Path| mux_Select

    %% Final Pin Placements
    mux_Select --> pin_Result
    mux_Select --> pin_Carry
```
