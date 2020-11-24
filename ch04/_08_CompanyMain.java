package ch04;

public class _08_CompanyMain {
	public static void main(String[] args) {
		
		
		//	setter를 통해 값전달, 출력(단 싱글톤패턴을 이용해 접근
		_08_Company ex1 = _08_Company.getInstance();	// 객체가 아니라 주소값?
		ex1.setCompanyName("삼성");
		ex1.setAddress("서울");
		ex1.setTeleno("12345");
		ex1.printInfo();
		_08_Company ex2 = _08_Company.getInstance();
		ex2.setTeleno("54321");
		ex1.printInfo();
		System.out.println((ex1 == ex2));
		
		
	}
}
