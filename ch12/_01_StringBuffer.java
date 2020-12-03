package ch12;

public class _01_StringBuffer {
	public static void main(String[] args) {
		/*
		 * StringBuffer : 문자열을 추가하거나 변경할 때 주로 사용하는 자료형
		 * - 추가 : append()
		 * - 삽입 : insert(시작위치, 문자열) : 특정 위치에 원하는 문자열을 삽입한다.
		 * - subString(시작위치, 문자열) : 시작위치에서 끝위치-1까지의 문자열을 추출한다. 공백포함
		 * 							  인덱스는 0부터 시작하며, 끝위치보다 작아야한다.
		 * - toString() : 메서드를 이용해서 String형으로 변경한다.
		 */
		StringBuffer sb = new StringBuffer();
		sb.append("맛있게 ");
		sb.append("먹으면 ");
		sb.append("0칼로리 ");
		
		System.out.println("sb : " + sb);
		System.out.println(sb.toString());
		
		// -삽입 : insert(시작위치, 문자열)
		sb.insert(8, "정말로 ");
		System.out.println("sb : " + sb);
		
		// subString(시작위치, 문자열) : 시작위치에서 끝위치-1까지의 문자열을 추출한다. 공백포함
		// 							  인덱스는 0부터 시작하며, 끝위치보다 작아야한다.
		System.out.println(sb.substring(12, 16));	// 0칼로리
		System.out.println(sb.substring(4, 7));		// 먹으면
		
		
		
	}
}
