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