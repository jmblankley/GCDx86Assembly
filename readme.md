# Assembly GCD

**Author:** Joshua M. Blankley  
**Date:** 29 November 2023

## Project Description

This project is meant to learn assembly language.

## Technologies Used

I built this project using NASM x86 64bit Assembly Language in an Ubuntu VM, as well as in native Linux Mint

## Installation

In the terminal:

1. Use `make` to compile and generate an executable named `gcd`.
2. Execute the program using `./gcd`.

## Usage

This program askes the user for two integer inputs and returns the GCD of the two values.

Example:

```console
Enter first number: 7
Enter second number: 28
The GCD of 7 and 28 is 7.
```

## Development Log

- Built up the main file and created the pseudocode/steps to approach the problem.
- Having issues converting from string (char array) to integers.
- Moved on from the conversion issue (still needs to be fixed) and worked on the rest of the code.
- Got getGCD to where I think it is going to work great once I get the conversion issue figured out.
- Fixed the conversion issue!! Need to get findGCD fixed up a bit
- Got findGCD working perfect! Just need to clean up the output.
- So findGCD was not working perfect (sad), I went over the algorithm again, though hard about some advice on it and finally figured it out!
- Fixed all bugs!
- Cleaned up the answer format and finished it up.

## BUGS

- (FIXED) It takes in both values but does not convert them properly.
- (FIXED) The findGCD function is set up well I believe but is not working due to the converison bug.
- (FIXED) The program compiles and does not end from a segmentation fault, but does not give the expected output.

## Note for Dr. Blythe

I really enjoyed this project. It was a great challenge and I feel like I learned a lot about how to approach programming in a better way. It was the most frustrating and also the most rewarding project I think I have ever done. Thank you again for all the help.
