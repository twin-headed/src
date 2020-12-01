package choi;

import java.util.HashMap;
import java.util.Scanner;

public class Hashmap {
	public static void main(String[] args) {
		
		HashMap<String,String> dc = new HashMap<String,String>();
		Scanner sc = new Scanner(System.in);

		dc.put("1","a");
		dc.put("2","b");
		dc.put("3","c");
		dc.put("4","d");
		dc.put("5","e");

		do{
			System.out.println("아이디를 입력해주세요");
			String id = sc.next();
			if(id.equals("q") || id.equals("Q")) {
				break;
			}else if(dc.containsKey(id)) {
				System.out.println("비밀번호를 입력해주세요");
				String pwd = sc.next();
				if(dc.get(id).equals(pwd)) {
					System.out.println("로그인되었습니다.");
				}else System.out.println("비밀번호가 틀립니다.");
			}else System.out.println("아이디가 틀립니다.");		
		}while(true);

		System.out.println("종료");
		sc.close();
	}
}