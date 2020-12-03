package ch11;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class _05_FileReaderTest {
	public static void main(String[] args) throws IOException {
		FileReader fr = null;
		
		int i;
		try {
			fr = new FileReader("D:\\Dev76\\fileTest\\fileReader.txt");
			
			while((i = fr.read()) != -1) {
				System.out.print((char)i);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally {
			if(fr != null) fr.close();
		}
		System.out.println();
		System.out.println("정상종료");
		
	}
}
