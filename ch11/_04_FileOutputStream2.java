package ch11;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class _04_FileOutputStream2 {
	public static void main(String[] args){
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			fis = new FileInputStream("D:\\Dev76\\file\\inputStream.txt");
			fos = new FileOutputStream("D:\\Dev76\\file\\outputStream.txt", true);
			int i;
			while((i=fis.read()) != -1) {
				System.out.println((char)i);
				fos.write(i);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(fis != null) fis.close();
				if(fos != null) fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("end");
		System.out.println("정상종료");
		
	}
}
