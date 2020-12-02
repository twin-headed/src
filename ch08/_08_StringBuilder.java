package ch08;

public class _08_StringBuilder {
		// p373
	public static void main(String[] args) {
		String javaStr = new String("java");
		System.out.println("javaStr 문자열 주소 : " + System.identityHashCode(javaStr));
		
		StringBuilder buffer = new StringBuilder(javaStr);
		System.out.println("연산 전 buffer 메모리 주소 : " + System.identityHashCode(buffer));
		
		buffer.append("  and");
		buffer.append("  android");
		buffer.append(" programminig is fun");
		System.out.println(System.identityHashCode(buffer));
		
		javaStr = buffer.toString();		// 왜 생략이 안되는가
		System.out.println(javaStr);
		System.out.println("연결된 javaStr 문자열 주소: " + System.identityHashCode(javaStr));
		
	}
	
	
}
