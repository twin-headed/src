package ch11;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

public class _09_ImageCopy {
	public static void main(String[] args) throws IOException {
		
		Scanner input = new Scanner(System.in);
		System.out.println("원본 파일명을 입력하세요 : "); // 경로 포함
		String inputFileName = input.next();	  // file명을 읽는다.
		
		System.out.println("복사 파일명을 입력하세요 : "); // 경로 포함
		String outputFileName = input.next();
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			fis = new FileInputStream(inputFileName);
			fos = new FileOutputStream(outputFileName);
			
			int i;
			while((i = fis.read()) != -1) {
				fos.write(i);
			}
			System.out.println(inputFileName + "를" + outputFileName + "으로 복사하였습니다");
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally {
			
		}
	}
}
