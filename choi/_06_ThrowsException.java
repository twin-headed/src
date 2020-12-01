package choi;

import java.util.Scanner;

public class _06_ThrowsException {
	
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {	// 여기서 throws Exception : 메인함수를 호출한 JVM에게 떠넘긴다.
		//	readAge() : 나이 출력
		//  입력받은 나이가 0세 미만이면 예외발생 2자미만이면 예외(ArithmeticException) 발생
		try {
			int age = readAge();
			System.out.println("나이 : " + age);
		}catch(ArithmeticException a) {
			System.out.println(a.getMessage());
			return;
		}finally {
			sc.close();
			System.out.println("실행종료");
		}
	}
	
	static int readAge() throws ArithmeticException {
		System.out.println("나이를 입력하세요");
		int age = sc.nextInt();
		if(age < 10) {
			throw new ArithmeticException("나이는 두자리수 이상이어야합니다.");
		} else return age;
	}
}
