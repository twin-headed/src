package ch10;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class _04_IOException {
	public static void main(String[] args) {
		
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream("a.txt");
		} catch (FileNotFoundException e) {
			System.out.println("getMessage() : " + e.getMessage()); // a.txt(지정된 파일을 찾을수 없습니다)
			return;	// 함수종료..  finally까지 수행되고 "정상종료" 출력 안됨
		} finally {
			System.out.println("finally ~~~");
			if(fis != null) {
				try {
					fis.close();
				} catch ( IOException e) {
					e.printStackTrace();
				}
					
			}
		}
		
		System.out.println("정상종료");
			
	}
}
