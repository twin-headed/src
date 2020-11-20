package ch02;

import java.util.Scanner;

public class _08_SwitchCaseEx {
	public static void main(String[] args) {
		/*
		 *	switch(조건) {
		 *		case 값1	:	수행문1;
		 *						break;	
		 * 		case 값2	:	수행문2;
		 * 						break;
		 * 		case 값3	:	수행문3;
		 * 						break;
		 * 		default	:	수행문4;
		 */
		// 숫자 출력 ==>  .. str : 하나, 두서넛, 대여섯, 많음
		//	1 : 하나 2: 두서넛
		int num = 10;
		String str = "";
			switch(num) {
			case 1:str="하나";
					break;
			case 2 : case 3: case 4:str="두서넛";
					break;
			case 5: case 6:str="대여섯";
					break;
			default : str = "많음";
		} 
			System.out.println(str);
	}
}
