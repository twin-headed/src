package test;

public class _23_StudentInfo {

	private String hakBun;
	private int score;

	public _23_StudentInfo(String hakBun, int score) {
		this.hakBun = hakBun;
		this.score = score;
	}	

	public void showStudentInfo() {
		System.out.println("학번 : " + hakBun);
		System.out.println("점수 : " + score);
	}
}
	