package ch04;

public class _04_StudentMain {
	public static void main(String[] args) {
		
		// 방법1. 디폴트 생성자 -> setter로 값 설정
		_04_StudentInfo sc = new _04_StudentInfo();
		// 실행순서 1 => 매개변수로 값전달
		sc.setStudentID("12345");
		sc.setStudentName("김태희");
		sc.setScore(100);
		
		// 방법2. 매개변수 생성자로 값 설정
		_04_StudentInfo st = new _04_StudentInfo("12345","김태희",100);
		
		
	}
}
