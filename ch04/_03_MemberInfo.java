package ch04;

import java.util.Scanner;

public class _03_MemberInfo {
	// 클래스 =  멤버변수+생성자+멤버메서드
	// 멤버변수
	private String name;
	private int age;
	private String email;
	
	// 디폴트생성자	: 매개변수가 없는 생성자
	// 생성자 이름은 클래스 이름과 같고,	반환값이 없으며, 변수 초기화 목적
	//	디폴트생성자를 생략시 컴파일할 때 컴파일러에서 자동으로 생성자를 만들어 준다.
	//	인스턴스 생성됨과 동시에 호출된다.
	public _03_MemberInfo() {
		System.out.println("디폴트 생성자");
	}
	
	//매개변수 생성자 : 매개변수가 있는 생성자
	//생성자 이름은 클래스 이름과 같고,	반환값이 없으며, 변수 초기화 목적
	// 자바컴파일러는 생성자가 하나도 없는 경우에만 디폴트 생성자를 제공한다.
	// 즉 프로그래머가 생성자를 직접 추가하면 디폴트생성자는 만들어지지 않는다
	public _03_MemberInfo(String name, int age, String email) {
		System.out.println("매개변수 생성자");
		this.name = name;
		this.email = email;
		this.age = age;
	}
	
	// 생성자 오버로드
	// [면접] 오버로드 : 메서드나 생성자의 매개변수 갯수가 다르거나, 매개변수 타입이 다른 경우를 말한다(단 리턴타입은 무관하다.)
	public _03_MemberInfo(String name, int age) {
		System.out.println("매개변수 생성자");
		this.name = name;
		this.age = age;
	}
	//멤버메서드
	Scanner sc = new Scanner(System.in);
	
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setAge(int age) {
		if(age<0) {
			while(age<0) {
				System.out.printf("나이는 양수여야 합니다 다시 입력하세요 : ");
				age = sc.nextInt();
			}
		}
		this.age = age;
	}
	public void printInfo() {
		System.out.println(name);
		System.out.println(age);
		System.out.println(email);
	}
	
	
}
