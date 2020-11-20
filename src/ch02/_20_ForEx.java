package ch02;

import java.util.Random;

public class _20_ForEx {
	public static void main(String[] args) {
		for(int i=2; i<10; i++) {
			System.out.println("---------");
			System.out.println("*** "+i+"단"+" ***");
			System.out.println("---------");
			for(int j=1; j<10; j++) {
				int result = i*j;
				System.out.println(i+"×"+j+"="+result);
			}
		}
		
		
		
	}
}
