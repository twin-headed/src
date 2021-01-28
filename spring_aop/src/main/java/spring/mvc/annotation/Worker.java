package spring.mvc.annotation;

public class Worker {
	
	private String companyName;
	private String email;
	private String salary;
	private String position;
	
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	public void showInfo() {
		System.out.println();
		System.out.println("=== 핵심 관심 ... 비즈니스 로직 ====");
		System.out.println("companyName : "+companyName);
		System.out.println("email : "+email);
		System.out.println("salary : "+salary);
		System.out.println("position : "+position);
		System.out.println("==========================");
		System.out.println();
	}
	
	
}
