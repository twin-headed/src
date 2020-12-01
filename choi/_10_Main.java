package choi;

import java.util.Scanner;

public class _10_Main {
//	readMemberInfo() 호출 / 정상이면 showMemberInfo() 호출, 예외처리 , Member 이름, 나이 입력 출력
	
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		try { 
				readMemberInfo();
		}catch(_10_InvalidNameException e) {
			System.out.println(e.getMessage());
			e.showWrongName();
		}catch(_10_InvalidAgeException e) {
			System.out.println(e.getMessage());
			e.showWrongAge();
		}finally {
			System.out.println("실행종료");
			sc.close();
		}
	}
	
	static _10_MemberInfo readMemberInfo() throws _10_InvalidNameException, _10_InvalidAgeException  {
		String name = readName();
		int age = readAge();
		_10_MemberInfo member = new _10_MemberInfo(name, age);
		member.showMemberInfo();
		return member;
	}
	
	static String readName() throws _10_InvalidNameException{
		System.out.println("이름을 입력하세요");
		String name = sc.next();
		if(name.length() < 2) {
			_10_InvalidNameException ine = new _10_InvalidNameException("잘못된이름");
			ine.setWrongName(name);
			throw ine;
		}else return name;
	}
	
	static int readAge() throws _10_InvalidAgeException{
		System.out.println("나이를 입력하세요");
		int age = sc.nextInt();
		if(age < 10) {
			_10_InvalidAgeException iae = new _10_InvalidAgeException("잘못된나이");
			iae.setWrongAge(age);
			throw iae;
		}else return age;
	}
	
	
	
}
