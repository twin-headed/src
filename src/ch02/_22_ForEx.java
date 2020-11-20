package ch02;

public class _22_ForEx {
	public static void main(String[] args) {
		
		/*
		 * continue문 예제
		 * 	continue문은 반복문과 함께 쓴다.
		 * 반복문 안에서 continue문을 만나면,	그	이후의 문장은 수행하지 않고,
		 * for문의 처음으로 돌아가 증감식을 수행한다.
		 */
		//	1~100까지의 홀수 합계 : total
		
		int total = 0;
		
		for(int i=1; i<100; i++) {
			if(i%2 ==0)
				continue;
			total += i;
		}
		System.out.println(total);
		
	}
}
