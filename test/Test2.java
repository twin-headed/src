package test;

public class Test2 {
	public static void main(String[] args) {
		
		MemberInfo sc = new MemberInfo();
		MemberInfo st = new MemberInfo("12355","cdfgawe",1234,3454);
	
		sc.setJuminNo("756789");
		sc.setName("feafa");
		sc.setAge(1234);
		sc.setSalary(12355);
		
		sc.printInfo();
		st.printMember();
	}
}
