package choi;

// 사용자 정의 Exception - Exception 상속
public class _09_InvalidNameException extends Exception{
	// 멤버변수
	private String wrongName;
	// 디폴트 생성자
	_09_InvalidNameException () {}
	// 매개변수 생성자
	_09_InvalidNameException(String message) {
		super(message); 
	}
	// getter , setter
	public String getWrongName() {
		return wrongName;
	}
	public void setWrongName(String wrongName) {
		this.wrongName = wrongName;
	}
	// 에러메시지 출력
	public void showWrongName() {
		System.out.println("잘못 입력된 이름 : " + wrongName);
	}
}
