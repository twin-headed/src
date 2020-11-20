package ch02;

import java.util.Scanner;

public class _06_IfEx {
	public static void main(String[] args) {
		/*
		 * 입장료
		 * age : 나이 입력받는다.
		 * charge : 요금
		 * grade : 단계
		 * 
		 * 1~8세	: grade "미취학아동" , charge : 1000
		 * ~13세 : grade "초등학생"	charge : 2000
		 * ~19세 : grade "청소년"		charge : 3000
		 * ~64세 : grade "일반인"		ADULT_CHARGE : 4000 ==> charge에 대입
		 * 65세 이상인경우 : "경로우대",		ADULT_CHARGE의 20% 할인  ==> charge에 대입
		 * 
		 * 
		 * *출력형식 ==> 나이 : ~세이며,	미취학아동, 입장료 : 1000원
		 */
		
		Scanner sc = new Scanner(System.in);
		System.out.print("나이를 입력하세요 : ");
		int age = sc.nextInt();
		int charge = 0;
		String grade = "";
		final 	int ADULT_CHARGE = 4000;
		
		if(age <= 0) {
			while(age <= 0) {
				System.out.print("다시 입력하세요 : ");
				age = sc.nextInt();
			}
		}
		if(age > 0 && age < 9) {
			charge = 1000;
			grade = "나이 : 1~8세이며 , 미취학아동";
		}else if(age > 8 && age < 14) {
			charge = 2000;
			grade = "나이 : ~13세이며 , 초등학생";
		}else if(age > 13 && age < 20) {
			charge = 3000;
			grade = "나이 : ~19세이며 , 청소년";
		}else if(age > 20 && age < 65) {
			charge = ADULT_CHARGE;
			grade = "나이 : ~64세이며 , 어른";
		}else if(age >= 65){
			charge = (int) (0.8*ADULT_CHARGE);
			grade = "경로우대이며 , 어르신";
		}
		System.out.println(grade + ", " + "입장료 : "  + charge + "원");
		sc.close();
		
	}
}
