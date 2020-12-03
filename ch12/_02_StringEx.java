package ch12;

public class _02_StringEx {
	public static void main(String[] args) {
		
		String proverb = "A Barking dog";	// 상수풀
		String s1,s2,s3,s4,s5;
		
		// 문자열 길이 : length()
		System.out.println("문자열 길이 : " + proverb.length()); //문자열 길이 : 13
		
		// 문자열 결합 : concat("연결할 문자열")
		s1 = proverb.concat(" never Bites!!");
		System.out.println("s1 : " + s1);
		
		// 문자 교환 : replace(oldChar, newChar)
		s2 = s1.replace('B', 'b');
		System.out.println("s2 : " + s2); //s2 : A barking dog never bites!!
		
		// 부분 문자열 : substring(beginIndex, endIndex) .. beginIndex <=, < endIndex
		s3 = s2.substring(5, 9);
		System.out.println("s3 : " + s3); // s3 : king
		
		// 대문자로 변환 : toUpperCase()
		s4 = s2.toUpperCase();
		System.out.println("s4 : " + s4); // s4 : A BARKING DOG NEVER BITES!!
		
		// 소문자로 변환 : toLowerCase()
		s5 = s4.toLowerCase();
		System.out.println("s5 : " + s5); // s5 : a barking dog never bites!!
		
	}
}
