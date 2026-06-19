# 8-bit CPU Core in Verilog

📌 Project Overview (FIXED)

*This project implements an 8-bit custom CPU in Verilog HDL with separate instruction and data memories, inspired by Harvard-style memory organization.

*Unlike traditional SAP-1 style educational processors that use a unified memory structure, this design separates instruction and data storage to improve clarity of execution, modularity, and architectural scalability.

*The processor operates using a multi-cycle control unit based on T-state sequencing, where each instruction progresses through fetch, decode, and execute phases under a deterministic timing control system.

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
