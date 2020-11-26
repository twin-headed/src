package ch07;

public class _07_Main {
	public static void main(String[] args) {
		
		fit1(25,18,6,5);
		
		
		
		//	자식의 매개변수 생성자로 호출
		//	대출,	반납정보 호출
		
	}
	
	public static void fit1(int num1, int num2, int num3, int num4) {
		System.out.println((num1/num3)*(num2/num4));
	}
	
	
	
}


/*
 * 대출상태 : 대출중
 * 대출시 : 대출할 수 없습니다.
 * 책이름 : 
 * 대출상태 : 
 * 대출인 : ~~
 * 대출일 : ~~
 * ==============
 * 대출시 : 이미 대출중입니다.
 * ==============
 * 반납되었습니다.
 * 반납시 : 반납할 수 없습니다.
 * 대출상태 : 대출가능
 * ==============
 * 반납시 : 반납할 수 없습니다.
 * 
 */
