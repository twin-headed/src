package ch01;

public class _06_OperatorEx {
	public static void main(String[] args) {
		
		/*
		 * 연산
		 * 1.	사칙연산자
		 * 
		 */
		System.out.println("===사칙연산자 예제===");
		
		int num1 = 8;	//변수 선언 , 초기화
		int num2 = 4;	//변수 선언 , 초기화
		
		int addR = num1 + num2;
		int subR = num1 - num2;
		int mulR = num1 * num2;
		int divR = num1 / num2;
		int modR = num1 % num2;
		
		int [] all = {addR,subR,mulR,divR,modR};
		
		for(int i=0; i<all.length; i++) {
			switch(i) {
			case 0:
				System.out.println("덧셈값 : " + all[0]);
				break;
			case 1:
				System.out.println("뼬셈값 : " + all[1]);
				break;
			case 2:
				System.out.println("곱셈값 : " + all[2]);
				break;
			case 3:
				System.out.println("나눗셈값 : " + all[3]);
				break;
			case 4:
				System.out.println("나머지값 : " + all[4]);
				break;
			}
		}
		
		/*
		 * 2. 증감연산자
		 * 1) 전위연산자: y = ++x; ==> ++x; y = x;
		 * 	1. x값을 1증가한 후 2. 증가값을 y에 대입한다.
		 * 
		 * 2) 후위연산자 : y = x++; ==> y=x; y = x;
		 * 1. x값을 먼저 y에 대입한후 2. x값을 증가시킨다.
		 * 
		 */
		System.out.println("===증감연산자 예제===");
		
		
		int c = 5;
		System.out.println(c);
		int nextC = ++c;
		System.out.println(nextC);
		
		
		int d = 5;
		int nextD = d++;
		System.out.println(d);
		System.out.println(nextD);
		
		int e = 2, f = 3, result = 0;
		System.out.println(++e + --f * e--); // 6
		System.out.println("e = " + e);	//2
		System.out.println("f = " + f);	// 2
		
		result = ++e + --f * e--;
		System.out.println("result = " + result);	// 4	
		System.out.println("e = " + e);	// 2
		System.out.println("f = " + f);		// 1
		
		/*
		 * 연산
		 * 3.	관계연산자 : 같다(==), 같지않다(!=), >, <, >=, <=
		 * 
		 */
		System.out.println("===관계연산자 예제 ===");
		
		int c1 = 10;
		int c2 = 20;
		System.out.println("c1 == c2 : " + (c1 == c2));
		System.out.println("c1 != c2 : " + (c1 != c2));
		System.out.println("c1 > c2 : " + (c1 > c2));
		System.out.println("c1 < c2 : " + (c1 < c2));
		System.out.println("c1 <= c2 : " + (c1 <= c2));
		System.out.println("c1 >= c2 : " + (c1 >= c2));
		
		
		/*
		 * 4.	복합 연산자
		 * 
		 */
		System.out.println("===복합연산자 예제===");
		
		int i = 5;
		i = i + 10;
		System.out.println("i  = " + + i);
		
		/*
		 * 연산
		 * 5.	논리연산자: 1이면 참,	True이며,	0이면 거짓, False이다.
		 * &&(논리곱) : x && y ==> x와 y 모두 참이면 참, 그렇지 않으면 거짓
		 * ||(논리합) : x||y ==> x와 y중에서 하나만 참이면 참, 그렇지 않으면 거짓
		 * 
		 */
		System.out.println("===논리연산자 예제 ===");
		int z1 = 4, y1 = 5;
		
		System.out.println((z1 == 4)&&(y1 == 5)); // T && T ==> T
		System.out.println((z1 == 4)&&(y1 == 4)); // T && F ==> F

		
		System.out.println((z1 == 4)||(y1 == 7)); // T || T ==> T
		System.out.println((z1 == 8)||(y1 == 10)); // F || F ==> T
		
		/*
		 * 연산
		 * 6.	삼항연산자: 항이 3개인 연산자를 의미한다.
		 * 						조건식? 결과1 : 결과2;
		 * 						조건식이 참이면 결과1을 수행하고. 거짓이면 결과2를 수행한다.
		 */						
		// 6-1.	삼항연산자
		// score가 60이상이면 "합격", 그렇지 않으면 "불합격"을 result
		
		int score = 10;
		String result1 = "";
		result1 = score >= 60? "합격" : "불합격";
		System.out.println(result1);
		
		// score가 60이상이면 "합격", 미만이면 "불합격"을  40점 미만이면 과락 result2
		
		String result2 = "";
		
		result2 = score >= 60? "합격" : score < 40? "과락" : "불합격";
		
		System.out.println(result2);
		
		
		
		
		
		
		
	}
}
