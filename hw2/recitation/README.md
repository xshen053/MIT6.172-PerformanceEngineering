## My Cpu Info
```
desc: I1 cache:         32768 B, 64 B, 8-way associative
desc: D1 cache:         32768 B, 64 B, 8-way associative
desc: LL cache:         8388608 B, 64 B, direct-mapped

Architecture:            x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Address sizes:         48 bits physical, 48 bits virtual
  Byte Order:            Little Endian
CPU(s):                  16
  On-line CPU(s) list:   0-15
Vendor ID:               AuthenticAMD
  Model name:            AMD Ryzen 7 PRO 4750U with Radeon Graphics
    CPU family:          23
    Model:               96
    Thread(s) per core:  2
    Core(s) per socket:  8
    Socket(s):           1
    Stepping:            1
    Frequency boost:     enabled
    CPU max MHz:         1700.0000
    CPU min MHz:         1400.0000
    BogoMIPS:            3393.32
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc
                          rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm
                          cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb ca
                         t_l3 cdp_l3 hw_pstate ssbd mba ibrs ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 cqm rdt_a rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 x
                         saves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsaveerptr rdpru wbnoinvd cppc arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flu
                         shbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif v_spec_ctrl umip rdpid overflow_recov succor smca
Virtualization features: 
  Virtualization:        AMD-V
Caches (sum of all):     
  L1d:                   256 KiB (8 instances)
  L1i:                   256 KiB (8 instances)
  L2:                    4 MiB (8 instances)
  L3:                    8 MiB (2 instances)
NUMA:                    
  NUMA node(s):          1
  NUMA node0 CPU(s):     0-15
Vulnerabilities:         
  Itlb multihit:         Not affected
  L1tf:                  Not affected
  Mds:                   Not affected
  Meltdown:              Not affected
  Mmio stale data:       Not affected
  Retbleed:              Mitigation; untrained return thunk; SMT enabled with STIBP protection
  Spec store bypass:     Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:            Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:            Mitigation; Retpolines, IBPB conditional, STIBP always-on, RSB filling, PBRSB-eIBRS Not affected
  Srbds:                 Not affected
  Tsx async abort:       Not affected
```

## 2.2 Cachegrind
```
==32387== Cachegrind, a cache and branch-prediction profiler
==32387== Copyright (C) 2002-2017, and GNU GPL'd, by Nicholas Nethercote et al.
==32387== Using Valgrind-3.18.1 and LibVEX; rerun with -h for copyright info
==32387== Command: ./sum
==32387== 
--32387-- warning: L3 cache found, using its data for the LL simulation.
Allocated array of size 10000000
Summing 100000000 random values...
Done. Value = 938895920
==32387== 
==32387== I   refs:      3,440,163,970
==32387== I1  misses:            1,343
==32387== LLi misses:            1,334
==32387== I1  miss rate:          0.00%
==32387== LLi miss rate:          0.00%
==32387== 
==32387== D   refs:        610,051,947  (400,037,910 rd   + 210,014,037 wr)
==32387== D1  misses:      100,546,603  ( 99,920,907 rd   +     625,696 wr)
==32387== LLd misses:       79,723,121  ( 79,097,466 rd   +     625,655 wr)
==32387== D1  miss rate:          16.5% (       25.0%     +         0.3%  )
==32387== LLd miss rate:          13.1% (       19.8%     +         0.3%  )
==32387== 
==32387== LL refs:         100,547,946  ( 99,922,250 rd   +     625,696 wr)
==32387== LL misses:        79,724,455  ( 79,098,800 rd   +     625,655 wr)
==32387== LL miss rate:            2.0% (        2.1%     +         0.3%  )
==32387== 
==32387== Branches:        210,030,488  (110,030,106 cond + 100,000,382 ind)
==32387== Mispredicts:           3,626  (      3,451 cond +         175 ind)
==32387== Mispred rate:            0.0% (        0.0%     +         0.0%   )
```

### Instruction Cache and Data Cache

The L1 cache is usually split into two sections: the instruction cache and the data cache. The instruction cache deals with the information about the operation that the CPU must perform, while the data cache holds the data on which the operation is to be performed.

```
For Instruction Cache:

Total instruction references (I refs): 3,440,163,970
Level 1 instruction cache misses (I1 misses): 1,343
Last-level instruction cache misses (LLi misses): 1,334
Instruction Level 1 miss rate (I1 miss rate): 0.00%
Last-level instruction cache miss rate (LLi miss rate): 0.00%

For Data Cache:

Total data references (D refs): 610,051,947 (400,037,910 reads + 210,014,037 writes)
Level 1 data cache misses (D1 misses): 100,546,603 (99,920,907 reads + 625,696 writes)
Last-level data cache misses (LLd misses): 79,723,121 (79,097,466 reads + 625,655 writes)
Data Level 1 miss rate (D1 miss rate): 16.5% (25.0% reads + 0.3% writes)
Last-level data cache miss rate (LLd miss rate): 13.1% (19.8% reads + 0.3% writes)

For Last-Level Cache (Instruction + Data):

Total cache references (LL refs): 100,547,946 (99,922,250 reads + 625,696 writes)
Total cache misses (LL misses): 79,724,455 (79,098,800 reads + 625,655 writes)
Last-level cache miss rate (LL miss rate): 2.0% (2.1% reads + 0.3% writes)
```