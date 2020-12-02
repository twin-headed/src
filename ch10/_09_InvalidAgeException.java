package ch10;

public class _09_InvalidAgeException extends Exception{
	
	private int wrongAge;
	
	_09_InvalidAgeException(String message) {
		super(message);
	}
	
	public int getWrongAge() {
		return wrongAge;
	}
	public void setWrongAge(int wrongAge) {
		this.wrongAge = wrongAge;
	}
	
	public void showWrongAge() {
		System.out.println(wrongAge + "살");
	}
	
}
