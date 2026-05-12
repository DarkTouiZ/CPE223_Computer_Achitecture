# CPE223 Computer Architecture

Coursework repository for CPE223 Computer Architecture. The repository contains practice problems and lab materials focused on C programming, ARM assembly, recursion, memory operations, branching, and sorting algorithms.

## Repository Contents

```text
.
├── Problem_session3/
│   └── PB_3.c
└── Problem_Session4/
    ├── Lab4_GuideLine.pdf
    ├── BubbleSort.s
    └── Quick_Sort.s
```

## Topics Covered

- Recursive function calls in C
- Fibonacci sequence calculation
- ARM assembly syntax and instruction flow
- Register usage and memory addressing
- Branching and subroutine calls
- Bubble sort implementation in assembly
- Quick sort implementation in assembly

## Problem Session 3

`Problem_session3/PB_3.c` contains a recursive C program that calculates the 44th Fibonacci number.

Build and run it with a C compiler:

```bash
gcc Problem_session3/PB_3.c -o fibonacci
./fibonacci
```

Expected output format:

```text
The 44th number in the fibonacci sequence is: <value>
```

## Problem Session 4

`Problem_Session4/` contains lab materials and ARM assembly sorting examples.

Files:

- `Lab4_GuideLine.pdf` - lab guideline document
- `BubbleSort.s` - bubble sort implementation for an integer array
- `Quick_Sort.s` - quick sort implementation for an integer array, with detailed comments

The assembly examples use ARM-style instructions such as:

- `DCD` for defining constant data
- `LDR` and `STR` for memory access
- `MOV`, `ADD`, and `SUB` for register operations
- `CMP` and conditional branches for control flow
- `BL` and `LR` for subroutine calls

## Running Assembly Files

The `.s` files are written for ARM assembly practice and can be opened in an ARM simulator or assembler environment used for the course, such as VisUAL2 or a compatible ARM assembly tool.

## Notes

This repository is organized by problem session. Each folder contains the relevant source files and supporting materials for that session.
