package ch02;

public class _10_WhileEx {
	public static void main(String[] args) {
		/*
		 * 	반복문 : 조건식이 참인 동안 반복(while문, for문)
		 * 			초기값 -> 조건식 -> 증감식
		 * 초기값
		 * while(조건식) {
		 * 			수행문1:
		 * 			수행문2:
		 * 			증감식;
		 * }
		 * 수행문3;
		 * 
		 */
		// Good Luck1~~	Good Luck2~~ Good Luck3~~ Good Luck4~~	Good Luck5~~
		int num = 5;
		
		
		while(num >= 1) {	// ==은 실행할 의무가 없다.
			System.out.print(" Good Luck"+num+"~~ ");
			num-=1;
		}
	}
}
