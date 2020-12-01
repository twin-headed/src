package choi;

public class _21_Book {

	private String bookNo; 		// key
	private String bookName;
	private String author;

	public _21_Book(String bookNo,String bookName, String author) {
		this.bookNo = bookNo;
		this.bookName = bookName;
		this.author = author;
	}
	
	public String getBookNo() {
		return bookNo;
	}
	
	@Override
	public String toString() {
		return bookName+"/"+author;
	}

}