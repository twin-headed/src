package practice;

import java.util.Random;

public class Yahtzee_re {
	
	public static void yahtzee_upper() {
			
			Random ran_num = new Random();
			int[] score = {0,0,0,0,0,0};
			int[] dice = {0,0,0,0,0};
			for(int i=0; i<dice.length; i++) {
				dice[i] = ran_num.nextInt(6)+1; 
			}
			for(int i=0; i<dice.length; i++) {
				switch(dice[i]) {
				case 1:
					score[0] += 1;
					break;
				case 2:
					score[1] += 2;
					break;
				case 3:
					score[2] += 3;
					break;
				case 4:
					score[3] += 4;
					break;
				case 5:
					score[4] += 5;
					break;
				case 6:
					score[5] += 6;
					break;
				}
			}
			int max = score[0];
			for(int i=0; i<score.length; i++) {
				if(max < score[i]) {
					max = score[i];
				}
			}
			System.out.printf("주사위 : ");
			for(int i=0; i<dice.length; i++) {
				System.out.print(dice[i]+",");
			}
			System.out.println();
			System.out.printf("점수 :");
			for(int i=0; i<score.length; i++) {
				System.out.print(score[i]+",");
			}
			System.out.println("최고점 : "+max);
	}
	public static void main(String[] args) {
		yahtzee_upper();
	}
}
