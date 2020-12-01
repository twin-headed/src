package choi;

import java.util.Scanner;

public class _05_ThrowsException {
	
	static Scanner input = new Scanner(System.in);
	public static void main(String[] args) {	// 여기서 throws Exception : 메인함수를 호출한 JVM에게 떠넘긴다.
		// 입력받은 이름이 2자미만이면 예외발생
		
		// 3. 예외 처리 : try~catch~finally 
		try {
			String strName = readName();
			System.out.println("이름 : " + strName);
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("예외메시지 : " + e.getMessage());
		} finally {
			input.close();
		}
		System.out.println("정상종료");
	}
	
	static String readName() throws Exception {	// 2. 상위메서드에게 예외처리를 미루는 throws Exception  // 떠넘기겠다
		System.out.println("이름을 입력하세요 : ");
		String name = input.next();
		
		if(name.length() < 2) {
			// 1. 강제로 예외 발생 : throw new Exception(message);
			// Exception e = new Exception("이름은 2글자 이상입니다.");
			// e.getMessage();
			throw new Exception("이름은 2글자 이상입니다.");	// 내가 만든 예외를  // Exception 클래스의 매개변수 생성자 호출
		} else {
			return name;
		}
		
		
	}
}
