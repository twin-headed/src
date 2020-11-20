package ch01;


public class _02_VariableEx {
	public static void main(String[] args) {
		
		/*
		 * 메서드명,변수명은 소문자로 시작한다.(cf. 클래스명은 대문자로 시작한다.)
		 * 변수 : 데이터를 담는 그릇이며,	데이터의 저장과 참조를 위해 메모리 공간을 할당받는다.
		 * 			반드시 먼저 선언: 컴파일러는 변수으ㅢ 자료형에 맞는 기억 공간을 미리 확보
		 * 			선언 : 자료형 변수명; 예) int a;
		 * 			선언과 동시에 할당 : 자료형 변수명 = 초기화; 예) int age = 30;
		 * 
		 * [면접문제]
		 * 1.	기본 자료형 (Primitive Type) : 실제값이 저장
		 * 		정수형 : byte short int long
		 * 		실수형 : float double
		 * 		논리형	: boolean - 1byte
		 * 		문자형 : char - 2byte
		 * 		
		 * 
		 * 2.	참조형(Reference Type) : 실제 객체를 가리키는 주소값 저장 
		 * 		클래스, 인터페이스 , 배열
		 * 
		 * 3. 문자열 : String 클래스
		 */
		
		
		int num1 = 0; // 0으로 초기화 가능
		num1 = 10;
		
		int num2 = 0;
		num2 = 20;
		
		long num3 = 12345678900L;	// long형은 숫자뒤에 L이나 1을 붙인다.
		
		char ch1 = ' ';	// char형은 '공백을 줘야된다'초기화
		ch1 = 'C'; // char형은 ''으로 초기화
		
		String name1 = "";	//공백이 없어도 무방하다.
		name1 = "김태희"; // String은 클래스이므로 대문자로
		
		float fnum1 = 3.14F;	//float형은 값뒤에 F나 f를 붙힌다.
		double dnum1 = 3.14;	// double형은 기본형이며, 생략
		
		System.out.println("num1 : "+ num1);
		System.out.println("num2 : "+ num2);
		System.out.println("ch1 : " + ch1);
		System.out.println("name1 : " + name1);
		System.out.println("fnum1 : " + fnum1);
		System.out.println("dnum1 : " + dnum1);
	}
}
