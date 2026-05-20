# DES64 Encryption/Decryption Hardware Implementation

A Verilog HDL implementation of the DES (Data Encryption Standard) encryption and decryption algorithm.

---

## Overview

This project implements the DES block cipher architecture using hardware design techniques in Verilog HDL.

Main components include:

- Initial Permutation (IP)
- Final Permutation (FP)
- 16-round Feistel Network
- Key Schedule Generation
- Encryption and Decryption
- FSM-based Control Unit
- Datapath architecture

The design was verified using simulation testbenches and synthesized for FPGA implementation.

---

## Features

- 64-bit DES encryption/decryption
- Verilog RTL implementation
- FSM-controlled architecture
- 16-round Feistel structure
- Functional simulation and verification
- FPGA synthesis ready

---

## Technologies Used

- Verilog HDL
- Vivado
- FPGA Design
- Finite State Machine (FSM)
- Digital Logic Design

---

## Project Structure

```text
rtl/    -> Verilog source files
tb/     -> Testbench files
docs/   -> FSM and waveform images
```

---

## Simulation Result

Example standard DES test vector:

| Plaintext | Key | Ciphertext |
|---|---|---|
| 0123456789ABCDEF | 133457799BBCDFF1 | 85E813540F0AB405 |

Simulation output matched expected DES ciphertext.

---

## Performance

- FSM-based sequential architecture
- Approximately 50 clock cycles per encryption
- **Synthesized Fmax:** ~227 MHz
- Approximately 80 clock cycles per encryption
- **Synthesized Fmax:** ~247 MHz

## Waveform result

![Waveform Decrypt](docs/waveform_Decrypt.png)
![Waveform Encrypt](docs/waveform_Encrypt.png)


