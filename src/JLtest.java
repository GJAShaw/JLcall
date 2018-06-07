/*
 * JLtest.java
 * Calls functions from the JLcall class
 */

class JLtest {

	public static void main(String[] args) {
		
		System.out.println("In Java");
		
		aboutToCall("com.avalokita.jlcall.JLcall.hello()");
		com.avalokita.jlcall.JLcall.hello();
		backInJava();
		
	}

	private static void aboutToCall(String funcName) {
		System.out.println("Java about to call " + funcName);
	}
	
	private static void backInJava() {
		System.out.println("Back in Java");
	}

}
