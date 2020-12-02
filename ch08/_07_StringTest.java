package ch08;

public class _07_StringTest {
		//	371p
		//	value	변수 : prvate final char[] value => final이므로 한번 생성된 문자열은 변경되지 앟는다.
		//	따라서 값이 변갱되거나 추가시 새로운 문자열이 생성된다.
	public static void main(String[] args) {

		String javaStr = new String("java");
		String androidStr = new String("android");
		System.out.println(javaStr);
		System.out.println("처음 문자열 주소 값 : " + System.identityHashCode(javaStr));
		
		javaStr = javaStr.concat(androidStr);
		
		System.out.println(javaStr);
		System.out.println("연결된 주소 값 : " + System.identityHashCode(javaStr));
		
		
		
		
	}
}
