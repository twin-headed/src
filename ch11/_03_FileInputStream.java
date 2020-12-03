package ch11;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class _03_FileInputStream {
	public static void main(String[] args) throws IOException {
		
		// inputStream.txt를 byte 단위로 읽어서 콘솔에 출력
		// 주의사항 : 탐색기의 파일확장명 보이도록 체크한다.
		// 메모장 저장시 UTF-8로 선택되어야 한다.
		
		FileInputStream fis = null;
		// 예외발생 => try -> catch -> finally
		// 예외발생 x =>
		
		try {
			fis = new FileInputStream("D:\\Dev76\\file\\inputStream.txt");
			int i;
			while((i=fis.read()) != -1) {		// 파일의 끝에 도달하면 -1을 반환
				System.out.print((char)i);	// 출력
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
