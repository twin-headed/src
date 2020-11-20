package ch02;

public class _21_ForEx {
	public static void main(String[] args) {
		
		//	2 ~ 20까지의 짝수의 합계
		//	증감식을 활용
		int j =0;
		for(int i =2; i<=20; i+=2) {
			j+=i;
		}
		System.out.println(j);
	}
}
