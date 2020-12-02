package ch08;

public class _06_StringTest1 {
		// 	p470
		// 	str1, str2는 동적메모리 공간인 힙메모리 주소.
		//	Stringt, Integer 클래스는 equals(), hashCode()가 미리 재정의 되어있다.
	public static void main(String[] args) {
		String str1 = new String("abc");
		String str2 = new String("abc");
		
		System.out.println(str1 == str2);
		System.out.println(str1.equals(str2));
		
		String str3 = "abc";
		String str4 = "abc";
		
		System.out.println(str3 == str4);
		System.out.println(str3.equals(str4));
		
		
		
	}
}
