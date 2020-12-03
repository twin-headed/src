package ch11;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class _04_FileOutputStream {
	public static void main(String[] args){
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			fis = new FileInputStream("D:\\Dev76\\file\\inputStream.txt");   // 파일명 직접 내가 생성
			fos = new FileOutputStream("D:\\Dev76\\file\\outputStream.txt", true); // 자동 생성, true를 주면 한번생성된 자료에 연결되어 출력된다.
			
			int i;
			while((i=fis.read()) != -1) {		// input 데이터를 1byte씩 읽어서 아스키 코드로 변환.. 파일의 끝까지
				System.out.print((char)i);	// 아스키값을 char형으로 변환후 화면에 출력	
				fos.write(i);					// input 파일을 읽어서 output파일에 출력
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
				try {
					if(fis != null) fis.close();	// close()메서드를 썻을때 스트림이 생성되지 않았을때 발생하는 NullPointerException을 막기위해 
					if(fos != null) fos.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			
				
		}
		
	}
}
