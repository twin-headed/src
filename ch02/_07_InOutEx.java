package ch02;

import java.util.Scanner;

public class _07_InOutEx {
	public static void main(String[] args) {
		
		/*		자바 API => https://docs.oracle.com/javase/8/docs/api/
		 * 
		 * 
		 * 변수
		 * 1. 기초형(Primitive Type) : 실제값이 저장
		 * 		-데이터타입 변수명 = 값;
		 * 		int score = 70;
		 * 
		 * 2. 참조형(Reference Type) : 실제 객체를 가리키는 주소값이 저장
		 * 		-클래스,	인터페이스,	배열
		 * 		-클래스인 경우
		 * 		클래스명 참조변수명 = new 클래스명();
		 * 		참조변수명.멤버메서드;
		 * 		참조변수명.멤버변수;
		 * 	
		 * 		예) Scanner scan = new Scanner(System.in);
		 * 		-	참조변수명에는 객체(인스턴스)를 가리키는 주소값이 들어있다.
		 * 
		 */
		
		
		
		// 두수의 합 구하기
		int x = 10;		// 첫번째 숫자를 입력받아 저장
		int y = 20;		// 두번째 숫자를 입력받아 저장
		
		// 클래스명 참조변수명 = new 클래스명();
		Scanner scan = new Scanner(System.in); // 힙메모리에 객체(인스턴스)를 생성하고, 그 주솟값을 scan에 대입
		System.out.print("첫번째 숫자를 입력하세요 : ");
		// 참조변수명.메서드
		x = scan.nextInt();	//콘솔에서 입력받은 첫번째 숫자를 읽어서 x에 저장
		System.out.print("두번째 숫자를 입력하세요 : ");
		y = scan.nextInt();	//콘솔에서 입력받은 첫번째 숫자를 읽어서 x에 저장
		
		
		int sum = x + y;
		System.out.println("sum : " + sum);
		System.out.println("프로그램종료");
		scan.close();	//자원해제
		
		
	}
}
