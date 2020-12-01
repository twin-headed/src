package choi;

// 사용자 정의 Exception이며 반드시 Exception을 상속받아야 한다.
public class _08_IDFormatException extends Exception {
	
	// 3. throw new 사용자 정의 예외에서 호출
	public _08_IDFormatException(String message) {
		// Exception 부모 매개변수 생성자로 매세지가 전달 -> 부모 멤버변수 전달 -> getMessage() 에서 리턴
		super(message);
		
		
	}
}
