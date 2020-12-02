package test;

public class _23_InvalidScoreException extends Exception{

	private int wrongScore;

	public _23_InvalidScoreException(String message) {
		super(message);
	}

	public int getWrongScore() {
		return wrongScore;
	}
	public void setWrongScore(int wrongScore) {
		this.wrongScore = wrongScore;
	}

	public void showWrongScore() {
		System.out.println("잘못된 점수 : " + wrongScore);
	}
}	