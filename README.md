# 8-bit CPU Core in Verilog 

## Project Overview 

- This project implements an 8-bit custom CPU in Verilog HDL with separate instruction and data memories, inspired by Harvard-style memory organization.

- Unlike traditional SAP-1 style educational processors that use a unified memory structure, this design separates instruction and data storage to improve clarity of execution, modularity, and architectural scalability.

- The processor operates using a multi-cycle control unit based on T-state sequencing, where each instruction progresses through fetch, decode, and execute phases under a deterministic timing control system.

  

<img width="1600" height="959" alt="image" src="https://github.com/user-attachments/assets/d36f62db-b1b4-4d7e-af74-34d6483fb6e6" />


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


 # Special ALU Operations
 
 ## POPCNT (Population Count) :  

- Counts the number of logic ‘1’ bits in the accumulator.

Example : A = 11110010 → POPCNT = 5

## THRESHOLD Operation : 

- Evaluates whether the number of set bits in the accumulator is ≥ 5.

Example : A = 11110010

Number of 1s = 5 → Output = 1


# Processor Architecture  
## Core Components  
- Program Counter (PC)
- Memory Address Register (MAR)
- Instruction Register (IR)
- Instruction Memory
- Data Memory
- Accumulator (A)
- Temporary Register (B)
- Arithmetic Logic Unit (ALU)
- Flag Register
- Bus Multiplexer
- FSM-based Control Unit
- T-state Timing Counter


<img width="491" height="472" alt="WhatsApp Image 2026-06-19 at 10 05 40 PM" src="https://github.com/user-attachments/assets/61378410-9c6a-4d79-9cd2-42990ab6a93f" />


# Memory Organization
## Instruction Memory
- 16 locations
- 8-bit width
- Harvard-separated instruction storage
## Data Memory
- 16 locations
- 8-bit width
- Independent from instruction memory


# Instruction Execution Cycle

## Fetch Phase

### T0

- PC → MAR
- Control signals: CO, MI

### T1

- Instruction Memory → IR
- PC increment
- Control signals: RO, II, CE

## Decode + Execute Example (ADD addr)

### T2

- Operand → MAR
- Control signals: IO, MI

### T3

- Data Memory → Register B
- Control signals: RO, BI

### T4

- ALU result → Accumulator
- Flags updated
- Control signals: EO, AI, FI

# Flag Register
 
## The CPU maintains three status flags

- Carry Flag (C) → Set on arithmetic overflow  
- Zero Flag (Z) → Set when ALU result is zero   
- Threshold Flag (T) → Set by THRESHOLD operation


# Future Enhancements

- Stack Pointer implementation  
- CALL / RET instructions  
- Interrupt handling system  
- UART communication interface  
- Pipelined datapath architecture  
- RISC-inspired instruction extensions


# Conclusion

This project demonstrates the design and implementation of a complete 8-bit Harvard inspired Architecture CPU using Verilog HDL.

It extends classical educational CPU models by introducing:  

- Separate instruction/data memories  
- Advanced ALU operations (POPCNT, THRESHOLD)  
- Multi-cycle FSM-based control logic


# References
- Ben Eater – Digital Computer Series  
- Computer Architecture Fundamentals  
- Verilog HDL Design Principles  
