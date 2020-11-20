package ch01;

public class _01_VariableEx {
	// 자바프로그램의 첫 시작 함수
	public static void main (String[] args) {
		
		String name = "홍길동";
		int age = 25;
		String email = "Was is as easy as it looked";
		
		System.out.println("이름: "+name);		//이름: + 홍길동
		System.out.println("나이: "+age);
		System.out.println("이메일: "+email);
		
		System.out.println("------------------------------------");
		
		int num1 = 10;
		int num2 = 20;
		int addR = num1 + num2;
		int subR = num1 - num2;
		int mulR = num1 * num2;
		double divR = (double)num1 / num2;
		
		
		System.out.println("덧셈결과: " + addR);
		System.out.println("뺄셈결과: " + subR);
		System.out.println("곱셈결과: " + mulR);
		System.out.println("나눗셈결과: " + divR);
		
		
	}
}
