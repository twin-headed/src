package ch11;

import java.io.FileWriter;
import java.io.IOException;

public class _06_FileWriterTest {
	public static void main(String[] args) {
		
		FileWriter fw = null;
		
		try {
			fw = new FileWriter("D:\\Dev76\\fileTest\\fileReader.txt");	// 자동 생성
			fw.write('A');	// 문자하나를 출력
			char buf[] = {'B','C','D','E','F','G'};
			fw.write(buf);	// 배열값 출력
			fw.write("즐거운 오후되세요~~");	// 문자열 출력
			// fw.write(배열명, 시작위치, 개수);
			fw.write(buf, 1, 3);
			fw.write("88");
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("출력완료");
	}
}
