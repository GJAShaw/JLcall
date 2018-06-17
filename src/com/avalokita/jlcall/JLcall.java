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

	// integerIsEven()
	public static native boolean integerIsEven(int integer);

	// alterIntArray()
	public static native int alterIntArray(int intArray[]);

	// load native library object
	static {
		System.loadLibrary("lcall");
	}
	
}
