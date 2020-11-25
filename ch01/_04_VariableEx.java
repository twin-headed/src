package ch01;

public class _04_VariableEx {
	public static void main(String[] args) {
		/*
		 * 상수:	프로그램이 실행되는 동안, 값이 변하지 않는 수 또는 변경 불가능한 수
		 * 			final 키워드는 변수에 값이 대입되고 나면 변수값이 더이상 변경불가
		 * 			주로 대문자를 사용
		 * 			만일 값변경시 상수를 선언한 부분의 값만 변경한다.
		 *			final 
		 *			1) 변수(상수) : 변수에 값 대입불가
		 *			2) 메서드 : 재정의불가
		 *			3) 클래스 : 상속불가
		 *
		 *
		 */
		
		final double PI = 3.14;	//상수로 선언한는 방법
		double val = 0.5;
		
		double result = PI * val;
		System.out.println("result : " + result);	//	1.57
	
		// PI = 3.15;	// 오류 : 상수는 final로 선언하며, 변경불가

		System.out.println("---------------");
		
		//	상수(MY_NAME, MY_AGE)를 이용해서 이름과 나이를 출력하시오.
		
		final String MY_NAME = "최문수";
		final int MY_AGE = 29;
		
		
		System.out.printf(MY_NAME + "\n");
		System.out.printf("%s",	MY_AGE + "살");
		
		
	}
}
