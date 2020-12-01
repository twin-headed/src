package choi;

// 사용자 정의
public class _09_InvalidAgeException extends Exception{
	
	// 멤버변수
	private int wrongAge;
	// 디폴트 생성자
	_09_InvalidAgeException() {}
	// 매개변수 생성자
	_09_InvalidAgeException(String message) {
		super(message);
	}
	// getter , setter
	public int getWrongAge() {
		return wrongAge;
	}
	public void setWrongAge(int wrongAge) {
		this.wrongAge = wrongAge;
	}
	// 에러메시지 출력
	public void showWrongAge() {
		System.out.println("잘못 입력된 나이 : " + wrongAge);
	}

}
