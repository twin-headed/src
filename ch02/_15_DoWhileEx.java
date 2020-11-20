package ch02;

import java.util.Scanner;

public class _15_DoWhileEx {
	public static void main(String[] args) {
		
		// 월입력[1~12]	:	입력월 출력
		//	범위초과(12보다 크거나, 1보다 작으면) => ~월은 잘못된 월입니다. 다시입력하세요~~
		Scanner sc = new Scanner(System.in);
		System.out.println("입력ㄱㄱ:");
		int month = sc.nextInt();
		do {
			if(month > 12 || month < 1) {
			System.out.print(month+"월은 잘못된 월입니다. 다시입력하세요~~ : ");
			month = sc.nextInt();
			}
		}while(month > 12 || month < 1);
		System.out.println(month+"월");
		
		
		
	}
}
