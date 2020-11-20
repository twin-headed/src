package practice;

import java.util.Scanner;

public class Print_Digit {
	public static void main(String[] args) {
		String plus = "";
		Scanner sc = new Scanner(System.in);
		System.out.print("숫자를 입력하세요 :");
		int input = sc.nextInt();
		int [] ar = new int[String.valueOf(input).length()];
		for(int i =0; i<String.valueOf(input).length(); i++) {
			ar[i] = Integer.parseInt(String.valueOf(input).substring(i,	 i+1));
			ar[i] ++;
		}
		for(int i =0; i<ar.length; i++) {
			plus += String.valueOf(ar[i]);
		}
		System.out.println(plus);
	}
}
