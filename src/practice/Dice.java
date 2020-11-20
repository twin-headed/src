package practice;

import java.util.Random;

public class Dice {
	
		public static void yahtzee_upper(){
			Random dice = new Random();
			int [] dices = {0,0,0,0,0};
			int [] results = {0,0,0,0,0,0};
			for (int i =0; i<5; i++) {
				dices[i] = dice.nextInt(6)+1;
			}
			for (int i =0; i<dices.length; i++) {
				switch(dices[i]) {
				case 1:
					results[0] += 1;
					break;
				case 2:
					results[1] += 2;
					break;
				case 3:
					results[2] += 3;
					break;
				case 4:
					results[3] += 4;
					break;
				case 5:
					results[4] += 5;
					break;
				case 6:
					results[5] += 6;
					break;
				}
			}
			int max = results[0];
			for(int i =0; i<results.length; i++) {
				if (max < results[i]) {
					max = results[i];
				}
			}
			System.out.println(max);
			for (int i =0; i<dices.length; i++) {
				System.out.print(dices[i] + ",");
			}
			System.out.println("\n===========================");
			for(int i=0; i<results.length; i++) {
				System.out.print(results[i] + ",");
			}
				
		}
		
		public static void main(String[] args) {
			yahtzee_upper();
			
			
	}
}
