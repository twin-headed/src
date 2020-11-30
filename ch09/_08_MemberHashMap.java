package ch09;

import java.util.HashMap;
import java.util.Map;

public class _08_MemberHashMap {
	public static void main(String[] args) {
		
	/*
	 * [시험]
	 * 다형성을 이용해서 해쉬맵 생성
	 */
		Map<String, Member> map = new HashMap<String, Member>();
		
		// HashMap에 멤버정보 추가
		// map.put(key, value);
		map.put("M001", new Member(1, "홍길동"));
		map.put("M002", new Member(2, "김태희"));
		map.put("M003", new Member(3, "아이유"));
		
		System.out.println(map);			// map.toString();
        //{M003=아이유회원님의 아이디는3입니다., M002=김태희회원님의 아이디는2입니다., M001=홍길동회원님의 아이디는1입니다.}
		// {key=value1, key2=value2, key3=value3..}
		
		// 멤버삭제
		map.remove("M002");
		System.out.println(map);
        //{M003=아이유회원님의 아이디는3입니다., M001=홍길동회원님의 아이디는1입니다.}
		
		// 멤버변경
		map.put("M003",  new Member(3, "강호동"));
		System.out.println(map);
        //{M003=강호동회원님의 아이디는3입니다., M001=홍길동회원님의 아이디는1입니다.}
		
		// 멤버추가
		map.put("M004", new Member(4, "유느님"));
		System.out.println(map);
        //{M004=유느님회원님의 아이디는4입니다., M003=강호동회원님의 아이디는3입니다., M001=홍길동회원님의 아이디는1입니다.}
		
		// 조회  - key, value 가져오기
		for(Map.Entry<String, Member>  str : map.entrySet()) { // map.entry 인터페이스에  entrySet 메서드로 map.entry 자료형으로 반환 ! 그리고 아래 메서드들 사용가능!
			String Key = str.getKey();
			Member value = str.getValue();
			System.out.println("Key : " + Key + ", value : " + value);
		/*	Key : M004, value : 유느님회원님의 아이디는4입니다.
		   	Key : M003, value : 강호동회원님의 아이디는3입니다.
		 	Key : M001, value : 홍길동회원님의 아이디는1입니다.
		*/
		}
	}
}
