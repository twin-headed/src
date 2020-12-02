package ch10;

import java.util.Scanner;

public class _09_Main {

	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		try {
			mainInfo();
		}catch(_09_InvalidNameException e) {
			System.out.println(e.getMessage());
			e.showwrongName();
		}catch(_09_InvalidAgeException e) {
			System.out.println(e.getMessage());
			e.showWrongAge();
		}finally {
			System.out.println("종료");
			sc.close();
		}
			
	}
	
	static _09_MemberInfo mainInfo() throws _09_InvalidNameException, _09_InvalidAgeException {
		String name = getName();
		int age = getAge();
		_09_MemberInfo member = new _09_MemberInfo(name, age);
		member.showMemberInfo();
		return member;
	}
	
	static String getName() throws _09_InvalidNameException {
		System.out.println("이름을 입력하세요");
		String name = sc.next();
		if(name.length() < 2) {
			_09_InvalidNameException ine = new _09_InvalidNameException("이름은 두글자이상");
			ine.setwrongName(name);
			throw ine;
		}
		return name;
	}
	
	static int getAge() throws _09_InvalidAgeException {
		System.out.println("나이를 입력하세요");
		int age = sc.nextInt();
		if(age < 10) {
			_09_InvalidAgeException iae = new _09_InvalidAgeException("나이는 두자릿수이상");
			iae.setWrongAge(age);
			throw iae;
		}
		return age;
	}
	
}
