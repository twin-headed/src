package choi;

import java.util.ArrayList;
import java.util.List;

public class _02_ArrayList {
	public static void main(String[] args) {
		
	/*
	 *	8. 검색 : list.indexOf(검색할 값);		 // 중요
	 *		  리스트에서 검색할 값과 똑같은 값을 갖는 첫번째 데이터를 찾아서 그 위치의 인덱스를 리턴한다.
	 *			list.lastIndexOf(검색할 값);
	 *			=> 리스트에서 검색할 값과 똑같은 값을 갖는 마지막번째 데이터를 찾아서 그 위치의 인덱스를 리턴
	 *
	 *		  검색할 값과 일치한 데이터가 없으면 -1을 리턴한다.
	 *		
	 */
	
		List<String> list = new ArrayList<String>();
		list.add("H");	// 0번째
		list.add("O");
		list.add("N");
		list.add("G");
		list.add("K");
		list.add("I");
		list.add("L");
		list.add("D");
		list.add("O");
		list.add("N");
		list.add("G");	//	10번째
		
		// 일치하는 첫번째 데이터를 찾아서 그 위치의 인덱스를 리턴한다.
		System.out.println("G의 인덱스"+list.indexOf("G"));
		System.out.println("N의 인덱스"+list.indexOf("N"));
		
		System.out.println("G의 마지막인덱스"+list.lastIndexOf("G"));
		System.out.println("N의 마지막인덱스"+list.lastIndexOf("N"));
		
		// 전체리스트 출력
		for(String string : list) {
			System.out.println(string);
		}
		// 전체삭제
		list.clear();
		System.out.println("리스트삭제후");
		System.out.println("list : " + list);
		
	}
}
