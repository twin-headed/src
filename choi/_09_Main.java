package choi;

import java.util.Scanner;

public class _09_Main {
	
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		//	readMemberInfo() 호출 / 정상이면 showMemberInfo() 호출, 예외처리 , Member 이름, 나이 입력 출력
		
		try {
//			_09_MemberInfo ef = readMemberInfo();
//			ef.showMemberInfo();
			readMemberInfo();
			
		}catch(_09_InvalidNameException e) {
			System.out.println(e.getMessage());
			e.showWrongName();
		}catch(_09_InvalidAgeException e) {
			System.out.println(e.getMessage());
			e.showWrongAge();
		}finally {
			System.out.println("실행종료");
			sc.close();
		}
	}
	
	public static _09_MemberInfo readMemberInfo() throws _09_InvalidNameException, _09_InvalidAgeException {
		String name = readName();
		int age = readAge();
		_09_MemberInfo member = new _09_MemberInfo(name, age);
		member.showMemberInfo();
		return member;
	}
	
	public static String readName() throws _09_InvalidNameException {
		System.out.println("이름을 입력해주세요");
		String name = sc.next();
		if(name.length() < 2) {
			_09_InvalidNameException ine = new _09_InvalidNameException("잘못된 이름입니다.");
			ine.setWrongName(name);
			throw ine;
		}
		return name;
	}
	public static int readAge() throws _09_InvalidAgeException {
		System.out.println("나이를 입력해주세요");
		int age = sc.nextInt();
		if(age < 10) {
			_09_InvalidAgeException iae = new _09_InvalidAgeException("잘못된 나이입니다.");
			iae.setWrongAge(age);
			throw iae;
		}
		return age;
	}
	
}
