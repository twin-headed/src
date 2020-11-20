package ch04;

public class _04_StudentInfo {
	//멤버변수 // 실행순서 3 => setter로 전달받은 값을 멤버변수에 보관
	private String studentID;
	private String studentName;
	private int score;
	
	// 디폴트 생성자
	public _04_StudentInfo() {}
	
	// 매개변수 생성자
	public _04_StudentInfo(String studentID, String studentName, int score) {
		this.studentID = studentID;
		this.studentName = studentName;
		this.score = score;
	}
	
	// 멤버메서드
	// setter, getter
	// 실행순서 2 => 매개변수 -> 멤버변수로 값 전달
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
		
	//	실행순서 4 => 멤버변수의 값을 return 받음
	public String getStudentID() {
		return studentID; 
	}
	
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentName() {
		return studentName; 
	}
	
	public void setScore(int score) {
		this.score = score;
	}
	public int getScore() {
		return score; 
	}
	
	//출력
	public void printInfo() {
		//System.out.println("학번 : " + studentID);
		//System.out.println("이름 : " + studentName);
		//System.out.println("성적 : " + score);
		System.out.println("학번 : " + getStudentID());
		System.out.println("이름 : " + getStudentName());
		System.out.println("성적 : " + getScore());
	}
}
