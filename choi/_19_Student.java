package choi;

public class _19_Student {
	private int studentId;
	private String studentName;
	private String email;
 
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	@Override
	public String toString() {
		return studentName+"님의 이메일은 "+email+"이고 아이디는 "+studentId+"입니다.";
	}

	
}
