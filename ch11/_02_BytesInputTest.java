package ch11;

import java.io.IOException;

public class _02_BytesInputTest {
	public static void main(String[] args) {
		System.out.println("알파벳 여러 개를 쓰고 [Enter]를 누르세요");
		
			try {
				while(true) {	// 무한루프
					int i = System.in.read();	// 데이터를 1byte씩 읽어들여서 아스키값으로 저장
					if(i == 13) {	// 10:줄바꿈, 13:Enter
						System.out.println("출력완료");
						break;
					}
					System.out.println((char)i);
					System.out.println("1");
				}
			}catch (IOException e) {
				e.printStackTrace();
			}	
		
	}
}
