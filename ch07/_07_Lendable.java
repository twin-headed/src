package ch07;

public interface _07_Lendable {
	//	상수
	int STATE_BORROWED = 1;
	int STATE_NORMAL = 0;
	
	//	추상메서드
	public void checkOut(String borrower,	 String date);	//	대출
	public void checkIn(String borrower,	 String date);	//	반납

}
