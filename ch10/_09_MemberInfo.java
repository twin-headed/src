package ch10;

public class _09_MemberInfo {
	
	private String name;
	private int age;
	
	_09_MemberInfo() {}
	
	_09_MemberInfo(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	public void showMemberInfo() {
		System.out.println("name : " + name);
		System.out.println("age : " + age);
	}
	
}
