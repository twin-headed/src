package ch11;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class _07_BufferedReader {
	public static void main(String[] args) {
		
		/*
		 * Buffered 스트림은 멤버변수로 8,192바이트 배열을 가지고 있다.
		 * 즉 한번 자료를 읽을 때 8KB 정보를 한꺼번에 읽고 쓸수있으므로 1바이트씩 읽고 쓸때마다 훨씬 수행속도가 빠르다.
		 * 매개변수에 기반 스트림을 주로 사용한다. 
		 */
		
		
		BufferedReader in = null;
		PrintWriter out = null;
		
		try {
			in = new BufferedReader(new FileReader("D:\\Dev76\\fileTest\\_08_fileReader.txt"));	// 직접 작성
			out = new PrintWriter("D:\\Dev76\\fileTest\\_09_fileReader.txt");	// 자동 생성
			
			int i;
			while((i = in.read()) != -1) {
				out.write(i);
			}
			System.out.println("출력완료");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(in != null) in.close();
				if(out != null) out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("출력완료");
	}
}
