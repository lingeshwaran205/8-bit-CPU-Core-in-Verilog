# 8-bit CPU Core in Verilog

 Project Overview (FIXED)

- This project implements an 8-bit custom CPU in Verilog HDL with separate instruction and data memories, inspired by Harvard-style memory organization.

- Unlike traditional SAP-1 style educational processors that use a unified memory structure, this design separates instruction and data storage to improve clarity of execution, modularity, and architectural scalability.

- The processor operates using a multi-cycle control unit based on T-state sequencing, where each instruction progresses through fetch, decode, and execute phases under a deterministic timing control system.

# Key Features

- 8-bit datapath architecture  
- Harvard memory organization  
- 16 × 8 Instruction Memory  
- 16 × 8 Data Memory  
- 4-bit Program Counter (PC)  
- 4-bit Memory Address Register (MAR)  
- Instruction Register (IR)  
- Accumulator-based execution model  
- Temporary Register (B)  
- Multi-cycle FSM-based Control Unit  
- Flag Register (Carry, Zero, Threshold)  
- External 8-bit Input Port  
- 7-Segment Display Output Interface  
- Custom ALU supporting advanced operations

 # Supported Instruction Set

| Opcode | Instruction | Description                              |
| ------ | ----------- | ---------------------------------------- |
| 0000   | NOP         | No Operation                             |
| 0001   | LDA         | Load accumulator from Data RAM           |
| 0010   | STA         | Store accumulator to Data RAM            |
| 0011   | ADD         | Add memory operand to accumulator        |
| 0100   | SUB         | Subtract memory operand from accumulator |
| 0101   | LDI         | Load immediate value                     |
| 0110   | JMP         | Unconditional jump                       |
| 0111   | JC          | Jump if Carry flag is set                |
| 1000   | JZ          | Jump if Zero flag is set                 |
| 1001   | OUT         | Output accumulator                       |
| 1010   | POPCNT      | Count number of set bits                 |
| 1011   | AND         | Bitwise AND                              |
| 1100   | OR          | Bitwise OR                               |
| 1101   | THRESHOLD   | Threshold-based evaluation               |
| 1110   | SHL         | Logical shift left                       |
| 1111   | HLT         | Halt processor                           |

# ALU Operation Set  

| ALU_SEL | Operation |
| ------- | --------- |
| 000     | ADD       |
| 001     | SUB       |
| 010     | AND       |
| 011     | OR        |
| 100     | SHL       |
| 101     | POPCNT    |
| 110     | THRESHOLD |
| 111     | PASS      |  

