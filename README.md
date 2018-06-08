# JLcall
JNI wrapper for various Linux system calls

# Why?
This is a personal self-teaching project on the topics of

* Java Native Interface (JNI)
* GitHub
* GNU Make

As such, it does not aim to be ground-breaking in its material, strictly object-oriented in its design, or enterprise-level in its methods, but it is certainly a lot of fun for me.

# Executables
* JLcall.class - a collection of static native methods designed to invoke system calls. Not very object-oriented, unless you pretend that it is modelling "the set of system call functions".
* liblcall.so - native shared object to wrap up those system calls
* JLtest.class - a tester class which runs the methods in JLcall

# Source
* JLcall.java - source for JLcall.class
* com_avalokita_jlcall_JLcall.c - source for liblcall.so
* JLtest.java - source for JLtest.class

# Target systems
Linux or other 'Nixy systems.

# Make syntax - includes a test run recipe
## make clean
Deletes all targets and intermediate files. I recommend you execute this immediately after cloning, for a fresh start.

## make all (default)
Creates targets except JLtest

## make tester
Creates JLtest class. The JLcall class must exist as a prerequisite.

## make testrun
Executes JLtest, to prove the functionality of the JLcall class.
