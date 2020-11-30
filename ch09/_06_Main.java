package ch09;

import java.util.HashMap;
import java.util.Scanner;

public class _06_Main {
	public static void main(String[] args) {
		/*
		 *  1. id, pwd 5건을 hashtable에 저장(hashMap에 저장)
		 *  2. 콘솔로부터 id, pwd를 입력받는다.(로그인)
		 *  	1과 2를 비교해서
		 *  3. 아이디가 없으면 "입력하신 아이디가 존재하지 않는다."
		 *  	아이디가 있으면 비밀번호와 비교해서 일치시 "로그인 되었습니다." 출력
		 *  											불일치시 "비밀번호가 일치하지 않습니다." 출력
		 *  4.	Q나 q이면 종료
		 *  
		 *  	  id		      pwd
		 *  	"hong"   "hong1234"
		 */
		
		HashMap<String,String> hashtable = new HashMap<String,String>();
		Scanner sc = new Scanner(System.in);
		
		for(int i=0; i<5; i++) {
			System.out.println("아이디와 비밀번호를 입력하세요");
			hashtable.put(sc.next(), sc.next());
		}
		do {
			System.out.println("로그인 하실 아이디를 입력해주세요.");
			String id = sc.next();
			if(id.equals("q") || id.equals("Q")) {
				break;
			} else if(hashtable.containsKey(id)) 	{	// id 일치
					System.out.println("PWD를 입력하세요 : ");
					String pwd = sc.next();
					if(pwd.equals(hashtable.get(id))) { // pwd 일치
						System.out.println("로그인되었습니다.");
					} else {
						System.out.println("비밀번호 일치하지 않습니다.");
					}
				} else {
					System.out.println("ID가 일치하지 않습니다.");
				}
		}while(true);
	
		System.out.println("종료되었습니다");
		sc.close();
	}
}
