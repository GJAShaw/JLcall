/*
 * JLcall.java
 * Wrapper for Linux system calls
 * JNI practice!
 */
package com.avalokita.jlcall;

public class JLcall {

	// enforce non-instantiability of class
	private JLcall() {
		throw new AssertionError();
	}
	
	// hello()
	public static native void hello();

	// load native library object
	static {
		System.loadLibrary("lcall");
	}
	
}
