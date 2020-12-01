package choi;

public class _09_MemberInfo {
	// 멤버변수
	private String name;
	private int age;
	// 디폴트 생성자
	_09_MemberInfo() {}
	// 매개변수 생성자
	_09_MemberInfo(String name, int age) {
		this.name = name;
		this.age = age;
	}
	//getter,setter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	// 정상일때 Member 출력정보
	public void showMemberInfo() {
		System.out.println(name+"놈");
		System.out.println(age+"살");
	}
}
