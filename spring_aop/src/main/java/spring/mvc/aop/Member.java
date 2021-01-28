package spring.mvc.aop;

// 핵심관심 클래스
public class Member {

	private String id;
	private String pwd;
	private String name;
	private String hobby;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
	public void getMemberInfo() {
		System.out.println();
		
		System.out.println("=== 핵심 관심 ... 비즈니스 로직 ====");
		System.out.println("id : " + getId());
		System.out.println("pwd : " + getPwd());
		System.out.println("name : " + getName());
		System.out.println("hobby : " + getHobby());
		System.out.println("==========================");
		System.out.println();
	}
	
}
