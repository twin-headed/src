package ch09;

import java.util.HashSet;
import java.util.Iterator;

public class _10_MemberHashSet {
	private HashSet<_10_Member> hashSet;
	
	public _10_MemberHashSet() {
		hashSet = new HashSet<_10_Member>();
	}
	
	public void addMember(_10_Member member) {
		hashSet.add(member);
	}
	
	public boolean removeMember(int memberId) {
		Iterator<_10_Member> ir = hashSet.iterator();
		
		while(ir.hasNext()) {
			_10_Member member = ir.next();
			int tempId = member.getMemberId();
			if(tempId == memberId) {
				hashSet.remove(member);
				return true;
			}
		}
		System.out.println(memberId+"가 존재하지 않습니다");
		return false;
	}
	
	public void showAllMember() {
		for(_10_Member member : hashSet) {
			System.out.println(member);
		}
		System.out.println();
	}
}
