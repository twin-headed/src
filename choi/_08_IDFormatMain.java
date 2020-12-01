package choi;

public class _08_IDFormatMain {
	private String userID;
	
	// 아이디에 대한 제약조건 구현
	public void setUserID(String userID) throws _08_IDFormatException {	// 4.
		if(userID == null) {
			// 2. 강제 예외 발생 throw new Exception(message);
			throw new _08_IDFormatException("아이디는 null일수가 없다.");
		}else if(userID.length() < 8 || userID.length() > 20) {
			throw new _08_IDFormatException("아이디는 8자 이상 20자 이하로 설정");
		}
		this.userID = userID;
	}
	
	public String getUserID() {
		return userID;
	}
	
	public static void main(String[] args) {
		
		_08_IDFormatMain main = new _08_IDFormatMain();
		String userID = "1234567";
		
		// 1. 예외가 발생할수 있는 코드 부분 - 아이디 값이 null인 경우
		try {
			main.setUserID(userID);
		} catch (_08_IDFormatException e) {
			System.out.println(e.getMessage());  // 5. 예외를 처리
		}
		System.out.println("정상종료");
	}
	
	
	
	
}
