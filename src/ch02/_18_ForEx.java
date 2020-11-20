package ch02;

public class _18_ForEx {
	public static void main(String[] args) {
		/*
		 * 반복문
		 * 
		 * for문의 기본구조
		 * 
		 * for(초기값; 조건식; 증감식) {
		 * 		수행문장1;
		 *		수행문장2; 
		 * 
		 */
		// GoodLuck1~~	GoodLuck2~~	GoodLuck3~~	GoodLuck4~~	GoodLuck5~~	
		// 무한루프
		
		// 1~10까지의 합: sum
		int sum = 0;
		for(int num=1; num<=10; num++) {
			sum+=num;
			System.out.println("num="+num+", sum="+sum);
		}
		System.out.println(sum);

		String [] number = {"A","2","3","4","5","6","7","8","9","10","J","K","Q"};
		String [] symbol = {"◇","♥","♧","♠"};
		
		for(int i=0; i<4; i++) {
			for(int j=0; j<13; j++) {
				System.out.printf(symbol[i]+number[j]+" ");
			}
			System.out.println();
		}
		
		
		
		
	}
}
