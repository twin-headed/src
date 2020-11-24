package ch04;

import java.util.Scanner;

public class _02_SungjukMain {
	public static void main(String[] args) {
		
		// 인스턴스 생성 
		Scanner sc = new Scanner(System.in);
		_02_Sungjuk st = new _02_Sungjuk();
		System.out.println("*** 성적 출력 ***");
		
		System.out.printf("국어점수 : ");
		st.korean = sc.nextInt();
		
		System.out.printf("영어점수 : ");
		st.english = sc.nextInt();
		
		System.out.printf("수학점수 : ");
		st.math = sc.nextInt();
		
		//국영수 합계 호출
		int total = st.getTotal();
		System.out.println(total);
		
		//국영수 평균 호출
		double avg = st.getAvg();
		System.out.printf("%.2f",avg);
	}
}
