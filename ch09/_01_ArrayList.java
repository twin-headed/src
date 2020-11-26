package ch09;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class _01_ArrayList {
	public static void main(String[] args) {
		
		/*
		 * 컬렉션 프레임워크
		 * 
		 * Collection 인터페이스
		 * -List 인터페이스 : 클래스는 ArrayList,	Vector,	LinkedList
		 * -Set 인터페이스 : 클래스는 HashSet,	TreeSet
		 * -Map 인터페이스 : 클래스는 HashMap, HashTalbe, TreeMap
		 * 
		 *	<면접>
		 *	1.	특징
		 *	List 인터페이스 : 순서가 있는 자료관리, 중복허용한다.
		 *						index를 사용하여 요소에 접근한다.
		 *						리스트에 들어있는 요소들의 인덱스는 0부터 시작한다.
		 *						클래스종류는 ArrayList, Vector, LinkedList
		 *
		 *	Set 인터페이스 : 순서가 없는 자료관리, 중복허용불가
		 *						클래스는 HashSet,	TreeSet
		 * 
		 *[ArrayList]
		 *	2.	선언
		 *	ArrayList<데이터타입클래스>	참조변수 = new ArrayList<데이터타입클래스>();
		 *
		 *	다형성 적용
		 *	List<데이터타입클래스>	참조변수 = new ArrayList<데이터타입클래스>();
		 *	
		 *	3. 특징 : 데이터 순서가 있고, 중복허용된다.
		 *	4. 추가 :  list.add(값);		//	앞에서부터 순서대로 추가
		 *				list.add(추가할 위치 index, 값);	// 지정한 인덱스에 값을 추가, 그 뒤 값은 밀려난다.
		 */
		//	2. 선언
//		ArrayList<String> list = new ArrayList<String>();
		List<String> list = new ArrayList<String>();
		
		//	4.	추가 : list.add(값);
		list.add("귤");					// 0번째
		list.add("감");					// 2번째
		list.add("바나나");				// 5번째
		list.add(1, "군고구마잉");		// 1번째
		list.add(3, "핏자");			// 3번째
		list.add(4, "바나나우유");		// 4번째
		list.remove(3);		// 피자 지워짐
		
		//	방법1. for문
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		System.out.println("----------------------------");
		
		//	방법2. 향상된 for문
		for(String i : list) {
			System.out.println(i);
		}
		
		//	방법3. 반복자(Iterator)	사용하기
		/*
		 *	사용목적 : 반복자는 java.util 패키지에 정의되어있는 Iterator 인터페이스를 구현하는 객체이다.
		 *				즉 컬렉션의 원소들에 접근하는것이 목적이다.
		 *
		 * 사용메서드
		 * - hasNext() : 아직 접근하지 않은 요소가 있으면 true를 반환
		 * - next()	: 다음 요소를 반환 ... Object 타입을 반환	=> Object : 가장 큰 클래스 자료형
		 * - remove() : 최근에 반환된 요소를 삭제한다.
		 */
		List<String> list2 = new ArrayList<String>();
		list2.add(0, "봄");
		list2.add(1, "여름");
		list2.add(2, "가을");
		list2.add(3, "겨울");
		
		Iterator iterator = list2.iterator();
		//	값이 존재하는 동안 이동해가면서 출력
		while(iterator.hasNext()) {	// ArrayList의 값이 존재하는지 체크	/ 리턴타입이 boolean
//			String str = Object;			// 존재하면 반복자는 값을 읽어서 Object 타입으로 리턴하므로, String형으로 형변환
			String season = (String) iterator.next();	//	값이 존재하면 season에 값 대입
			System.out.println(season);
		}
	}
}
