sys-profiler
============

Project for performance analysis

###Overview
Sampling tools like oprofile or dtrace's profile provider don't really provide methods to see what [multithreaded] programs are blocking on - only where they spend CPU time. Though there exist advanced techniques (such as systemtap and dtrace call level probes), it is overkill to build upon that. 

###How to use?
* Set the parameter that you want to analysis.
```
bash sys-profiller.sh <process_name>
```

###Credits
Originally this technology was released as a collaborative effort by Mark Callaghan and Domas Mituzas at http://mituzas.lt/2009/02/15/poor-mans-contention-profiling/

###Author
jiasir (Taio Jia) <jiasir@icloud.com>
