package choi;

public class MemberHashMapTest {
	public static void main(String[] args) {
		
		MemberHashMap memberhashmap = new MemberHashMap();
	
		Member memberLee = new Member(1001, "이지원");
		Member memberSon = new Member(1002, "손민국");
		Member memberPark = new Member(1003, "박서훤");
		Member memberHong = new Member(1004, "홍길동");
		
		memberhashmap.addMember(memberLee);
		memberhashmap.addMember(memberSon);
		memberhashmap.addMember(memberPark);
		memberhashmap.addMember(memberHong);
		
		memberhashmap.showAllMember();
		memberhashmap.removeMember(memberHong.getMemberId());
		memberhashmap.showAllMember();
		
	}
}
