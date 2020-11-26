package ch07;

//	자식클래스
public class _07_APPCDInfo extends _07_CDInfo implements _07_Lendable {
	private String borrower;	//대출자
	private String checkOutDate;
	
	public _07_APPCDInfo() {}
	
	public _07_APPCDInfo(String registerNo, String title, String borrower, String checkOutDate) {
		super(registerNo, title);
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
	}
	
	@Override
	public void checkOut(String borrower, String date) {
		if(Integer.valueOf(super.getRegisterNo()) == 1) {
			System.out.println("이미 대출중입니다.");
			System.out.println("책이름 : "+super.getTitle());
			System.out.println("대출인 : "+this.borrower);
			System.out.println("대출일 : "+this.checkOutDate);
		}else
		super.setRegisterNo(String.valueOf(_07_Lendable.STATE_BORROWED));
		this.borrower = borrower;
		this.checkOutDate = date;
		System.out.println("대출인 : "+this.borrower);
		System.out.println("대출일 : "+this.checkOutDate);
		
	}
	@Override
	public void checkIn(String borrower,	 String date) {
		if(Integer.valueOf(super.getRegisterNo()) == 0) {
			System.out.println("반납할수없습니다.");
		}else
		super.setRegisterNo(String.valueOf(_07_Lendable.STATE_NORMAL));
		System.out.println("반납되었습니다.");
		System.out.println("대출상태 : 대출가능");
		
	}
}
