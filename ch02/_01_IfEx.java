package ch02;

public class _01_IfEx {
	public static void main(String[] args) {
		/*
		 * if - else if - else문
		 * if(조건식1) {		//조건식1이 참인 경우 수행
		 * 		수행문1;
		 *  } else if(조건식2) {
		 *  	수행문2;		//조건식2가 참인 경우 수행
		 *  } else if(조건식3) {
		 *  	수행문3;		//조건식3이 참인 경우 수행
		 *  } else {
		 *  		수행문4;
		 *  }
		 *  수행문5;		//반드시 수행
		 */
		
		int age = 10;
		//8살 이상이면 "학교에 다닌다. "출력, 그렇지 않으면 "학교에 다니지 않는다."
		if(age >= 8) {
			System.out.println("학교에 다닌다.");
		} else System.out.println("학교에 다니지 않는다");
		
		
	}
}
