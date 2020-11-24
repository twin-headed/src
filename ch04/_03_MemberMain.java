package ch04;

import java.util.Scanner;

public class _03_MemberMain {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		_03_MemberInfo member1 = new _03_MemberInfo();	//디폴트 생성자 호출
		
		//	방법1. setter를 이용한 값설정
		member1.setName("최문수");
		member1.setEmail("aefa@afe");
		System.out.printf("나이를 입력하세요 : ");
		member1.setAge(sc.nextInt());
		
		member1.printInfo();

		System.out.println("----------------------");
		
		//방법2. 매개변수 생성자를 이용한 값설정
		_03_MemberInfo member2 = new _03_MemberInfo("김태희",25,"kim@naver.com");
		member2.printInfo();
		
		System.out.println("----------------------");
		
		_03_MemberInfo member3 = new _03_MemberInfo("김태희",25);
		member3.printInfo();
	}
}
