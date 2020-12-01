package choi;

public class _10_InvalidNameException extends Exception{
	
	private String wrongName;
	
	_10_InvalidNameException () {}
	
	_10_InvalidNameException(String message) {
		super(message);
	}
	
	public void setWrongName(String wrongName) {
		this.wrongName = wrongName;
	}
	public String getWrongName() {
		return wrongName;
	}
	
	public void showWrongName() {
		System.out.println("잘못 입력된 이름 : " + wrongName);
	}
	
}
