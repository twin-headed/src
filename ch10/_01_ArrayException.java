package ch10;

public class _01_ArrayException {
	public static void main(String[] args) {
		/*
		 * [면접]
		 * 예외 처리 목적 : 정상종료
		 * 
		 * try {
		 * 			// 예외가 발생할수 있는 코드 부분
		 * }	catch(처리할 예외타입 e) {
		 * 			//	try 블록안에서 예외가 발생핬을때 예외를 처리하는 부분
		 * 	}	finally {
		 * 			//	항상 수행되는 부분(예외가 발생하지 않더라도), 주로 자원해제를 위한 close() 문장이 온다.
		 * }
		 */
		int[] array = new int[5];
		
		try {
			for(int i=0; i<=array.length; i++) {
				array[i] = i;
				System.out.println(array[i]);
			}
		} catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("=== 예외 처리 부분 ===");
//			System.out.println("e : " + e);
//			e.printStackTrace(); 제일 많은 정보 알려줌
			System.out.println("e.getMessage() : " + e.getMessage());
		} finally {
			System.out.println("=== finally 부분 ===");
		}
		
		System.out.println("정상종료~~~~");
				
		
	}
}
