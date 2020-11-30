package ch09;

import java.util.ArrayList;
import java.util.List;

public class MemberArrayListTest {
	public static void main(String[] args) {
//		MemberArrayList memberArrayList = new MemberArrayList();
		
//		Member memberLee = new Member(1001, "이지원");
//		Member memberSon = new Member(1002, " 손민국");
//		Member memberPark = new Member(1003, "박서훤");
//		Member memberHong = new Member(1004, "홍길동");
//		
//		memberArrayList.addmember(memberLee);
//		memberArrayList.addmember(memberSon);
//		memberArrayList.addmember(memberPark);
//		memberArrayList.addmember(memberHong);
//		
//		memberArrayList.showAllMember();
//		
//		memberArrayList.removeMember(memberHong.getMemberId());
//		memberArrayList.showAllMember();
		
		List<Member> list = new ArrayList<Member>();
		
		list.add(new Member(1001, "이지원"));
		list.add(new Member(1002, "손민국"));
		list.add(new Member(1003, "박서훤"));
		list.add(new Member(1004, "홍길동"));
		
		for(Member member : list) {
			System.out.println(member);
		}
		
		System.out.println("=============");
		
		list.remove(0);
		
		for(Member member : list) {
			System.out.println(member);
		}
		
		
	}
}
