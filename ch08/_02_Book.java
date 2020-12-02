package ch08;

//	모든 클래스의 최상위 클래스 Object
public class _02_Book extends Object{
	int bookNumber;
	String bookTitle;
	
	public _02_Book() {}
	
	public _02_Book(int bookNumber,String bookTitle) {
		this.bookNumber = bookNumber;
		this.bookTitle = bookTitle;
	}
	
	// 부모 Object 클래스의 toString() 메서드를 재정의 => 실제 Book 정보 출력
	@Override
	public String toString() {
		return "bookNumber : "+ bookNumber + "  bookTitle : " + bookTitle;
	}
	/*
	 * toString() 메소드가 재정의 안되있다.
	 * Extends Object가 생략되어 있고, Object의 toString() 메서드가 호출되었다.
	 * Object의 toString(); 패키지명.클래스명@해시코드값 즉 주소값출력
	 * 재정의해서 객체 정보를 문자열로 반환해서 사용해야 원하는 정보를 출력할 수 있다.
	 */
	
}
