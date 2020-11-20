package ch02;

public class _07_SwitchCaseEx {
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
		// ranking에 따른 메달 색깔 출력
		String medal = "";
		int ranking = 4;
		
		switch(ranking) {
		case 1 :	medal = "금메달";
							break;
		case 2 :	medal = "은메달";
							break;
		case 3 :	medal = "동메달";
							break;
		default	: medal = "참가상";
		}
		System.out.println(medal +" , " + ranking);
	}
}
