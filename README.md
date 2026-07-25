# 🎮 Catch the Box Game using VGA Controller on FPGA

A hardware-based implementation of the classic **Catch the Box** game designed entirely in **Verilog HDL** and implemented on a **Zynq-7000 FPGA**. The project features real-time VGA graphics, hardware-based collision detection, pseudo-random object generation, and score tracking without using any processor or software.

---

## 📌 Project Overview

This project implements a complete game engine in hardware, where the player controls a basket using push buttons to catch falling boxes displayed on a VGA monitor. The entire game logic, graphics rendering, and score management are realized using RTL design on FPGA.

---

## ✨ Key Features

- VGA Controller supporting **640 × 480 @ 60 Hz** resolution
- Real-time falling box animation using clock division and RTL logic
- Push-button controlled basket with smooth, rate-controlled movement
- Hardware-based collision detection between the basket and falling boxes
- Score tracking system with dynamic VGA display (0–50)
- Pseudo-random box generation using LFSR-based logic
- Pixel-level VGA text rendering for displaying **TALLY** and **WIN** messages
- Modular RTL implementation in Verilog HDL
- On-board debugging using Xilinx Integrated Logic Analyzer (ILA)

---

## Hardware Implementation Results

**Figure 1. Real-Time FPGA Demonstration of the Catch the Box Game on a VGA Display**

<img width="4096" height="2302" alt="catch_the_box_img1" src="https://github.com/user-attachments/assets/b74c3144-0f0e-46cd-88f0-9fc4905ec8ed" />

**Figure 2. Vivado Integrated Logic Analyzer (ILA) captures showing real-time verification of score updates and game-over detection during FPGA execution**

<img width="4096" height="2730" alt="GridArt_20260725_233831683 jpg" src="https://github.com/user-attachments/assets/ed093c06-47d5-4ab5-ad29-c444a4014052" />

---

## 🛠 Tools & Technologies

- **Verilog HDL**
- **Xilinx Vivado**
- **Zynq-7000 FPGA Board**
- **VGA Interface**
- **Integrated Logic Analyzer (ILA)**
- **Push Buttons**

---

## 🔬 Verification

The design was verified through both simulation and FPGA implementation.

### Verification Highlights

- Functional verification of VGA synchronization signals
- Validation of falling box movement and basket control
- Verification of collision detection logic
- Score update verification
- Hardware debugging using Vivado Integrated Logic Analyzer (ILA)
- Real-time testing on Zynq-7000 FPGA with VGA display

---

## 📚 Learning Outcomes

This project provided hands-on experience in:

- FPGA-Based Digital System Design
- VGA Timing and Synchronization
- Pixel-Level Graphics Rendering
- RTL-Based Game Development
- Hardware Collision Detection
- Pseudo-Random Number Generation using LFSR
- Clock Division and Timing Control
- RTL Verification and Hardware Debugging
- FPGA Prototyping using Xilinx Vivado
