package ch02;

public class _24_PrintEx {
	public static void main(String[] args) {
		/*
		 * 	printf(형식지정자,값 또는 변수)
		 * - 형식지정자
		 * %d(decimal) : 정수를 출력한다.
		 * %f(float) : 실수를 출력한다.
		 * %c(charactor) : 한 문자를 출력한다.
		 * %s(string) : 문자열을 출력한다.
		 * 
		 */
		double	value	=	1.0/3.0;
		System.out.println("value : "+ value);
		System.out.printf("f",	value);
		
		System.out.println();
		// printf("%전체자릿수.나머지자릿수", value);		//자릿수 부족시 공백으로 채운다.
		System.out.printf("%6.2f",	value);	// 0.33 //	앞의 2자리가 공백으로 채워짐
		
		System.out.println();
		System.out.printf("%s","20201113");	//	
	}

}
