package ch09;

public class MemberHashMapTest {
	public static void main(String[] args) {
		
		MemberHashMap memberHashMap = new MemberHashMap();
		
		memberHashMap.addMember(new Member(1001, "이지원"));
		memberHashMap.addMember(new Member(1002, "손민국"));
		memberHashMap.addMember(new Member(1003, "박서훤"));
		memberHashMap.addMember(new Member(1004, "홍길동"));
		
		memberHashMap.showAllMember();
		
		memberHashMap.removeMember(new Member(1001, "홍길동").getMemberId());	// 매개변수 생성자의 숫자부분만 맞아도 인식을 한다.
		memberHashMap.removeMember(100);
		
		memberHashMap.showAllMember();
		

	}
}