package test;

public class _23_InvalidHakbunException extends Exception{

	private String wrongHakbun;

	public _23_InvalidHakbunException(String message) {
		super(message);
	}

	public String getWrongHakbun() {
		return wrongHakbun;
	}
	public void setWrongHakbun(String wrongHakbun) {
		this.wrongHakbun = wrongHakbun;
	}

	public void showWrongHakbun() {
		System.out.println("잘못된 학번 : " + wrongHakbun);
	}
}	