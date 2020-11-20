package ch02;

import java.util.Scanner;

public class _05_IfEx2 {
	public static void main(String[] args) {
		
		
		/*
		 * 학점 구하기
		 * 
		 * 1. 점수는 score 변수, 학점은 grade 변수
		 * 2.	점수가 90점 이상이면 A
		 * 		점수가 80점 이상이면 B
		 * 		점수가 70점 이상이면 C
		 * 		점수가 60점 이상이면 D
		 * 		점수가 60점 미만이면 F
		 * 	3. 결과 => 점수 : 80, 학점 : B
		 */
		Scanner sc = new Scanner(System.in);
		System.out.print("점수를 입력하세요 : ");
		char grade = ' ';
		int score = sc.nextInt();
		
		
	
		// 100보다 큰 경우, 0보다 작은경우 잘못된 점수입니다. 다시입력하세요.
		if(score < 0 || score > 100) {
			while(score < 0 || score > 100) {
				System.out.print("다시 입력하세요 : ");
				score = sc.nextInt();
				}
			}else if(score >= 90) {
				grade = 'A';
			}else if(score >= 80) {
				grade = 'B';
			}else if(score >= 70) {
				grade = 'C';
			}else if(score >= 60) {
				grade = 'D';
			}else grade = 'F';
		
		
		
		System.out.println("점수 : " + score+","+"학점 : " + grade );
	}
}

