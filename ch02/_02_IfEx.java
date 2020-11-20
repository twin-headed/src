package ch02;

public class _02_IfEx {
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
		int num = 100;
		String result = "";
		//	결과출력 => -10은 음수입니다.(양수/0/음수)
		if(num > 0) {
			result = "양수입니다.";
		} else if(num == 0) {
			result = "0입니다.";
		} else result = "음수입니다.";
		System.out.println(num + "은 " + result);
		
	}
}
