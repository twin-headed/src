package ch01;

public class _05_VariableEx {
		
	public static void main(String [] args) {
		/*
		 * 형변환-1.	p64
		 * 1.	자동적인 형변환(확대 형변환, 묵시적 형변환)
		 * 	데이터가 손실되지 않거나,손실이 제한적인 범위내에서 묵시적으로 형변환 된다.
		 * 자료형이 다른 변수에 값을 할당하는 경우, 형변환을 생략할 수 있다.
		 * 
		 * 데이터 큰타입 = 데이터 작은 타입;	(예:	float	f = 10;	//	f에 10.0이 대입)
		 * 잘형이 다른값을 연산하는 경우;	(예:	double	d = 10.0 + 30;	//	double d = 10.0 + 30.0;
		 * 
		 * 2.	강제적인 형변환(축소 형변환,	명시적 형변환)
		 * 		명시적으로 형변환 하는것을 캐스팅(Casting) 이라고 한다.
		 * 		casting은 생략할 수 없으며, 생략시 컴파일 오류 발생하므로 반드시 명시적으로 형변환해야 한다.
		 * 		강제로 형변환하므로 데이터 손실 위험이 있다.
		 * 		데이터 작은 타입 = (작은 타입)데이터 큰 타입;
		 * 
		 */
		
		System.out.println("형변환예제1");
		
		double d = 20;			//자동적인 형변환(확대 형변환, 묵시적 형변환) : 데이터 큰타입 = 데이터 작은타입;
		System.out.println("d: " + d);
		float f = 20.5f + 10;	//	20.5f + 10.0f;
		System.out.println("f : " + f); 	// f:30.5
		
		int i = (int) 10.5;		//	강제형변환(축소 형변환, 명시적 형변환) : 데이터 작은타입 = (작은타입)데이터 큰 타입.;
		
		/*
		 * 형변환-2.
		 * 3. int(4바이트) 보다 작은 자료형은 int형으로 형 변환후 계산
		 *		예) byte + short -> int + int
		 *4.	두개의 피연산자중 표현범위가 큰쪽에 맞춰서 형변환후 계산
		 */
		System.out.println("형변환예제2");
		
		int ii;
		double ff;
		
		ii = 5/3;	// int = int / int
		ff = (double) 5/3;
		System.out.printf("%.2f",ff);
		
		//형변환보다 ()안의 계산이 우선
		ii = (int) (2.5 + 3.3);	// int ii = (int)(double + double);	//	(int)(5.8) = 5
		System.out.println("ii:" + ii);
		
		int gg = 100000;
		int jj = 200000;
		int ll = 200000;
		
		int e1 = gg * jj;
		System.out.println(e1);
		
		long e2 = gg * jj; // ->long형에 대입하기 전부터 연산결과가 int형 범위 초과해서 오버플로우
		
		long e3 = (long) (gg * jj);
		System.out.println("e3 : " + e3); // 동일한결과
		
		
	}
}
