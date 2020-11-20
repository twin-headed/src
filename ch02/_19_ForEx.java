package ch02;

import java.util.Random;
import java.util.Scanner;

public class _19_ForEx {
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.printf("단입력:");
		int dan = sc.nextInt();
		for(int i=1; i<10; i++) {
			int result = dan*i;
			System.out.println(dan+"×"+i+"="+result);
		}
		
		
		
		
	}
}
