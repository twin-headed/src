package choi;

import java.util.HashMap;
import java.util.Map;

public class _05_HashMap {
	public static void main(String[] args) {
		/*
		 * [면접] p439
		 * 해싱(hashing) : 키를 이용해서 해시테이블로부터 데이터를 가져오는 과정
		 * 
		 * HashMap
		 * 1) 특징
		 * - 데이터의 순서를 보장하지 않는다.
		 * - key와  value쌍으로 저장한다.
		 * - key는 중복되면 안된다.
		 * - key를 이용해서 value를 가져올 수 있다.
		 * - List 게열과 달리 index가 없다.
		 * - Map이라는 인터페이스를 구현한 클래스이다.
		 * 
		 * 2) 선언
		 * - HashMap<Key 타입, value 타입> map = new HashMap<Key타입, value타입>();
		 * - Map<Key 타입, value타입> map = new HashMap<Key 타입, value타입>();	// 다형성 적용시
		 * 
		 * 3) 메서드
		 * - 데이터 추가 : put(key, value);
		 * - 데이터 가져오기 : get(key)
		 * - 데이터 삭제 : remove(key)
		 * - 데이터가 비어있는지 여부 : isEmpty()
		 * - 해당 키가 있는지 여부 : containsKey(key)
		 * - 해당 값이 있는지 여부 : containsValue(value)
		 * - 해당 갯수 : size()
		 */
		
		// map 생성
		HashMap<Integer, String> map = new HashMap<Integer, String>();
		// 데이터 추가 : put(key, value);
		map.put(1, "홍길동");
		map.put(2, "아이유");
		map.put(3, "유재석");
		map.put(4, "신동엽");
		map.put(5, "박하나");
		
		// map 전체 출력
		for(int i=1; i<=map.size(); i++) {
			System.out.println(map.get(i));
		}
		
		// 신동엽 데이터 가져오기
		System.out.println(map.get(4));
		
		// 유재석 데이터를 삭제  			
		map.remove(3);
		//	map 전체 출력
		for(int i=1; i<=map.size(); i++) {
			System.out.println(map.get(i));
		}	//	중간 삭제시 null로 들어가며, 당겨지지 않는다.
		
		// 데이터가 비어있는지 여부 : isEmpty()
		System.out.println("======데이터가 비어있는지 여부 : isEmpty() ==");
		System.out.println(map.isEmpty());	// false
		
		// 해당 키가 있는지 여부 : containsKey(key)
		System.out.println("=====해당 키가 있는지 여부 : containsKey(key) ===");
		System.out.println(map.containsKey(2));		// true
		System.out.println(map.containsKey(3));		// false
		
		// 해당 값이 있는지 여부
		System.out.println("=====해당 값이 있는지 여부 : containsValue(value) ===");
		System.out.println(map.containsValue("아이유"));		// true
		System.out.println(map.containsValue("유재석"));		// false
		
		System.out.println("=== 해당 갯수 : size() ==");
		System.out.println(map.size());	//4.... 1개가 삭제되었으므로
		
	}
}
