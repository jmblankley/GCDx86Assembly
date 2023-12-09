# Assembly GCD

**Author:** Joshua M. Blankley  
**Date:** 29 November 2023

## Project Description

This project is meant to assist in learning assembly language. It takes in two values and uses the Euclidean algorithm for finding the GCD of the two numbers.

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
