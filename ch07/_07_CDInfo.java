package ch07;

//	부모클래스
public class _07_CDInfo {
	//	멤버변수
	private String registerNo;	//	등록번호
	private String title;			//	타이틀
	
	//	생성자
	_07_CDInfo() {}
	
	_07_CDInfo(String registerNo, String title) {
		this.registerNo = registerNo;
		this.title = title;
	}
	
	//	멤버메서드
	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}
	public String getRegisterNo() {
		return registerNo;
	}
	public String getTitle() {
		return title;
	}
	
	public void showInfo() {
		System.out.println(registerNo);
		System.out.println(title);
	}
}
