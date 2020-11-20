package test;

public class MemberInfo {
	private String juminNo;
	private String name;
	private int age;
	private int salary;

	public MemberInfo() {}
	
	public MemberInfo(String juminNo, String name, int age, int salary) {
		if(age < 0 || salary < 0) {
			System.out.println("나이나 급여는 양수");
		}
		this.juminNo = juminNo;
		this.name = name;
		this.age = age;
		this.salary = salary;
	}
	
	public void setJuminNo(String juminNo) {
		this.juminNo = juminNo;
	}
	public String getJuminNo() {
		return juminNo;
	}
		
	
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}

	
	public void setAge(int age) {
		if(age < 0) {
			System.out.println("나이는 양수");
			return;
		}	
		this.age = age;
	}
	public int getAge() {
		return age;
	}
	
		
	public void setSalary(int salary) {
		if(salary < 0) {
			System.out.println("급여는 양수");
			return;
		}
		this.salary = salary;
	}
	public int getSalary() {
		return salary;
	}

	public void printInfo() {
		System.out.println(juminNo);
		System.out.println(name);
		System.out.println(age);
		System.out.println(salary);
	}

	public void printMember() {
		System.out.println(getJuminNo());
		System.out.println(getName());
		System.out.println(getAge());
		System.out.println(getSalary());
	}
	
}
