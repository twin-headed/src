package ch02;

import java.util.Scanner;

public class _09_SwitchCaseEx {
	public static void main(String[] args) {
		//	Test2
		//	점수를 입력받아 성적 계산
		
		/*	문제2:
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
		
		
		switch(score/10) {	// 변수 또는 수식이 올수있다 !
		case 9 : case 10: grade = 'A';
			break;
		case 8: grade = 'B';
			break;
		case 7: grade = 'C';
			break;
		case 6: grade = 'D';
			break;
		case 5: grade = 'F';
		}
		
		System.out.println(grade);
		
		
	}
}
