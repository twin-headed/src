package ch11;

import java.io.IOException;

public class _01_ByteInputTest {
	public static void main(String[] args) {
		System.out.println("알파벳 하나를 쓰고 엔터를 누르세요");
		
		int i ;
		
		try {
			i = System.in.read();			// 콘솔창에서 한바이트 읽음
			System.out.println("i: " + i);	// 아스키값 출력
			System.out.println((char)i);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
