package ch11;

import java.io.IOException;

public class _02_BytesInputTest2 {
	public static void main(String[] args) {
		System.out.println("알파벳 여러 개를 쓰고 [Enter]를 누르세요");
		
		while(true) {
			try {
				int i = System.in.read();
				if(i == 13) {
					System.out.println("출력완료");
					break;
				}
				System.out.println((char)i);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
}
