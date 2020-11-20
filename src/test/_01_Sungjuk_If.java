package test;


import java.util.Scanner;

import practice.Talking_Clock;

public class _01_Sungjuk_If {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);		
		System.out.print("점수를 입력하세요 : ");
		int score = sc.nextInt();
		char grade = ' ';
		
		if(score >= 90) {
			grade = 'A';
		}else if(score >= 80) {
			grade = 'B';
		}else if(score >= 70) {
			grade = 'C';
		}else if(score >=60) {
			grade = 'D';
		}else grade = 'F';
		
		System.out.println("점수: " +score+","+"학점: " + grade);
		sc.close();
		
		Talking_Clock tc = new Talking_Clock();
		tc.clock("12:00");
		
	}
}
	 