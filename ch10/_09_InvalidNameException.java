package ch10;

public class _09_InvalidNameException extends Exception{
	
	private String wrongName;
	
	_09_InvalidNameException(String message) {
		super(message);
	}
	
	public String getwrongName() {
		return wrongName;
	}
	public void setwrongName(String wrongName) {
		this.wrongName = wrongName;
	}
	
	public void showwrongName() {
		System.out.println(wrongName + "놈");
	}
	
}
