package ch08;

//	p358 + p361 + p365
class _03_Student{
		
		//	멤버변수
	int studentId;
	String studentName;
		//	생성자
	_03_Student(int studentId, String studentName) {
		this.studentId = studentId;
		this.studentName = studentName;
	}
		// equals 오버라이드 전후 확인 : p361
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof _03_Student) {
			_03_Student student = (_03_Student) obj;
			if(this.studentId == student.studentId) {
				return true;
			}else return false;
		}return false;
	}
		//	hashCode 오버라이드	p 365  5행~8행
	@Override
	public int hashCode() {
		return studentId;
	}
}


public class _03_StudentMain {
	
	public static void main(String[] args) {
		//	359 + p365		14~18행
		_03_Student studentLee = new _03_Student(100,"이상원");
		_03_Student studentSang = new _03_Student(100,"이상원");
		
		System.out.println(studentLee.equals(studentSang));
		System.out.println(studentLee.hashCode());
		System.out.println(studentSang.hashCode());
		
	}
}