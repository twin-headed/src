package ch09;

public class _10_Main {
	
	public static void main(String[] args) {
		// p407
		//	_10_Member에 equals(), hashCode()를 Override 해서 객체가 동일함을 구현해서 중복데이터는 추가되지 않도록 한다.
		_10_MemberHashSet memberHashSet = new _10_MemberHashSet();
		
		_10_Member memberLee = new _10_Member(1001,"이지원");
		_10_Member memberSon = new _10_Member(1002,"손민국");
		_10_Member memberPark = new _10_Member(1003,"박서훤");
		
		memberHashSet.addMember(memberLee);
		memberHashSet.addMember(memberSon);
		memberHashSet.addMember(memberPark);
		memberHashSet.showAllMember();
		
		_10_Member memberHong = new _10_Member(1003,"홍길동");
		memberHashSet.addMember(memberHong);
		memberHashSet.showAllMember();
		
	}
}
