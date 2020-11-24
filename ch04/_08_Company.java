package ch04;

public class _08_Company {
	
	//	멤버변수
	private String companyName;
	private String address;
	private String teleno;
	
	/*	싱글톤패턴
	 * - 인스턴스를 단 하나만 생성하는 디자인 패턴
	 * - static을 응용해서 프로그램 전반에서 사용하는 동일한 인스턴스 하나만 생성하는 방식
	 * - 접근할 클래스에서 여러 메서드가 있을때, 외부 클래스가 해당 메서드에 접근할 때마다 
	 * - 객체를 생성할 필요없이 getInstance()를 통해서 주소값만 리턴받아 접근한다.
	 * 
	 * 싱글톤패턴 생성
	 * -1단계. 생성자를 private로 만들기
	 * -2단계. 클래스 내부에 static으로 유일한 인스턴스 생성하기
	 * -3단계. 외부에서 참조할 수 있는 public 메서드 만들기
	 * 
	 * 호출
	 * 외부클래스명 참조변수 = 외부클래스명.getInstance();
	 * 예) _08_Company com1 = _08_Company.getInstance();	//클래스명.메서드명 
	 * 
	 */
	private _08_Company() {}
	
	private static _08_Company instance = new _08_Company();
	
	public static _08_Company getInstance() {
		if(instance == null) {
			instance = new _08_Company();
		}
		return instance;
	}
	
	//멤버메서드
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyName() {
		return companyName;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress() {
		return address;
	}
	
	public void setTeleno(String teleno) {
		this.teleno = teleno;
	}
	public String getTeleno() {
		return teleno;
	}
	
	public void printInfo() {
		System.out.println("회사명 : "+companyName+", 주소: "+address+", 전화번호: "+teleno);
	}
	
}
