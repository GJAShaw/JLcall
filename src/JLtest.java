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
		
		boolean isEven = true;
		System.out.println("isEven = " + isEven);
		aboutToCall("isEven = com.avalokita.jlcall.JLcall.integerIsEven(3)");
		isEven = com.avalokita.jlcall.JLcall.integerIsEven(3);
		backInJava();
		System.out.println("isEven = " + isEven);
		
	}

	private static void aboutToCall(String funcName) {
		System.out.println("Java about to call " + funcName);
	}
	
	private static void backInJava() {
		System.out.println("Back in Java");
	}

}
