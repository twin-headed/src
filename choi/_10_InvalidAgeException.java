package choi;

public class _10_InvalidAgeException extends Exception{
	
	private int wrongAge;
	
	_10_InvalidAgeException() {}
	
	_10_InvalidAgeException(String message) {
		super(message);
	}
	
	public int getWrongAge() {
		return wrongAge;
	}
	public void setWrongAge(int wrongAge) {
		this.wrongAge = wrongAge;
	}
	
	public void showWrongAge() {
		System.out.println("잘못 입력된 나이 : " + wrongAge);
	}
}
