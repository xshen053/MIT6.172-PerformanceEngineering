## Write-up 3: 
Provide a theory for why the compiler is generating dramatically different assembly.

The difference in the generated assembly code for the given code snippet can be attributed to several factors, including optimization strategies employed by the compiler, the specific architecture being targeted, and the specific optimizations enabled or disabled during compilation.

Conditional Branch Optimization: The code snippet includes conditional statements (if and the ternary operator ? :) that involve branching based on certain conditions. The compiler's optimization strategies for handling conditional branches can have a significant impact on the generated assembly code. Different optimization levels or compiler flags can result in different approaches to handling these branches, such as using branch instructions or optimizing them into conditional move instructions.

Register Allocation and Usage: The compiler's register allocation strategy can affect how variables and values are stored and accessed in registers. The specific choices made by the compiler regarding which registers to use and how to store values can influence the generated assembly code. Register allocation decisions can be influenced by factors such as the availability of registers, their usage across different parts of the code, and the optimization goals of the compiler.

Compiler Optimizations: Compilers employ various optimization techniques to improve code efficiency and performance. These optimizations can range from simple local optimizations to more complex global optimizations. The specific optimizations applied by the compiler can impact the generated assembly code. For example, common compiler optimizations include constant folding, dead code elimination, loop unrolling, and strength reduction. The chosen optimization level or compiler flags can influence which optimizations are enabled and the resulting assembly code.

Target Architecture and Instruction Set: The specific architecture and instruction set being targeted by the compiler play a crucial role in code generation. Different architectures have different sets of instructions, performance characteristics, and optimization strategies. The compiler generates assembly code tailored to the target architecture, taking advantage of specific instructions and optimizations that are most effective for that architecture.

It's worth noting that even minor changes in the code or compiler settings can lead to different assembly code generation. Therefore, the specific differences observed in the generated assembly code can vary based on these factors and other considerations during the compilation process.

Write-up 4: Inspect the assembly and determine why the assembly does not include
instructions with vector registers. Do you think it would be faster if it did vectorize?
Explain.

In this case, since the code copies only one byte at a time, vectorizing the loop may not provide significant performance gains. The overhead of loading and storing data into vector registers and handling potential dependencies could outweigh the benefits of parallelism. Moreover, if the target architecture does not have wide vector registers or lacks efficient support for byte-level vector operations, vectorization may not yield substantial improvements.

## Write-up 6:
Original ++++ VECTORIZE ++++ AVX2

0.067803 ---> 0.0242286 ---> 0.0152212

SSE vector registers are usually 128 bits, since data
type for each array is uint32_t (32bits), so we get speedup 4 times

AVX2 vector registers are 256 bits, so we get speedup 7-8 times

## Write-up 7:

`make ASSEMBLE=1` vs `make ASSEMBLE=1 VECTORIZE=1`

![image](https://github.com/xshen053/MIT6.172-PerformanceEngineering/assets/97472036/7ade9809-b5df-48d8-af8a-f4892c5a015e)

![image](https://github.com/xshen053/MIT6.172-PerformanceEngineering/assets/97472036/5739e785-5217-4b1f-a1e9-6ef08bf8c089)

`make ASSEMBLE=1 VECTORIZE=1` vs `make ASSEMBLE=1 VECTORIZE=1 AVX2=1`

SSE  = 16 Bytes
AVX2 = 32 Bytes

## Write-up 8:


## Write-up 9:
What is the new speedup for the vectorized code, over the unvectorized code,
and for the AVX2 vectorized code, over the unvectorized code, when you change __TYPE__
to uint64_t, uint32_t, uint16_t and uint8_t? For each experiment, set __OP__ to + and do
not change N.

speedup increases as data type size decreases.

`uint8_t`

0.078576 --- 0.000074 ---- 0.000035

speedup: 2245

make sense, because when for unvectorized codes, the number of instructions needed to perform
elementwise operations over an array of N elements is mostly independent of the data type width.

`no matter how small your data type width is, there is only one operation every time`

but for the vectorization, the smaller you data type width is, the more you can vectorize, 

eg.

256/64 = 4 elementwise operations / instruction

256/8 = 32 elementwise operations / instruction


