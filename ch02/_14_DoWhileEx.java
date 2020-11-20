package ch02;

public class _14_DoWhileEx {
	public static void main(String[] args) {
		
		/*
		 *	do-while문	:	반드시 1번은 수행하는 경우 사용, 
		 * 						조건이 만족하지 않을 때 블록을 빠져나간다.
		 * 						데이터를 처리하기 전에 사용자로부터 메뉴나 데이터를 입력받아야 하는경우 많이 사용한다.
		 *					
		 *	for문을 이용해 별표로 마름모를 구현하라 	1.소스 / 주석:결과이미지 복붙
		 *												2. ''
		 *												3.	''
		 *												4.	''
		 *
		 *do {
		 *		수행문1;
		 *		수행문2;
		 *	.....
		 *}while(조건식);
		 *
		 *
		 *
		 *
		 */
		
		//1부터 10까지의 합
		int i = 1;
		int j = 0;
		do {j+=i;
		i++;
		}while(i<11);
		System.out.println(j);
		
		
		
	}
}
