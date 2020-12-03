package ch11;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class _03_FileInputStream2 {
	public static void main(String[] args) throws IOException {
		
		FileInputStream fis = null;
		try {
			fis = new FileInputStream("D:\\Dev76\\file\\inputStream.txt");
			int i;
			while((i=fis.read()) != -1) {
				System.out.println((char)i);
			}
			System.out.println();
			System.out.println("end");
			System.out.println("정상종료");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally {
			fis.close();
		}
	}
}
