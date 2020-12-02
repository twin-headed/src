package ch09;

public class _10_Member {
	private int memberId;
	private String memberName;
	
	public _10_Member(int memberId, String memberName) {
		this.memberId = memberId;
		this.memberName = memberName;
	}
	
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
//	@Override
//	public String toString() {
//		return memberName + " 회원님의 아이디는 " + memberId + " 입니다. ";
//	}
	
	@Override
	public int hashCode() {
		return memberId;
	}
	
//	@Override
//	public boolean equals(Object obj) {
//		if(obj instanceof _10_Member) {
//			_10_Member member = (_10_Member) obj;
//			if(this.memberId == member.memberId) {
//				return true;
//			}
//			else return false;
//		}
//		return false;
//	}
}
