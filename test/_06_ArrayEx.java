package test;


public class _06_ArrayEx {
	
	public static void main(String[] args) {
		
		/*
		 * *** 성적표 ***
		 * =========================
		 * 번호	국어	영어	수학	총점	평균	학점
		 * =========================
		 *   1		100   100  100   300   100    A
		 *   2		100   100  100   300   100    A
		 *   3		100   100  100   300   100    A
		 *   4		100   100  100   300   100    A
		 *   5		100   100  100   300   100    A
		 *   ========================
		 *과목합  500   500  500  
		 *
		 *평균	: 소수점 이하 둘째자리
		 *2차원 배열명 => scores 국,영,수 점수는 주어진 값
		 *총점(sum),	평균(avg),	과목합(korTot, engTot, mathTot)은 직접계산
		 */
		
		
		int [][] scores = {
				{86,90,80},
				{80,70,60},
				{50,66,87},
				{74,59,77},
				{36,89,95}
		};
		
		int korTot=0,engTot=0,mathTot=0;
		System.out.println("*** 성적표 ***");
		System.out.println("==============================");
		System.out.println("번호	국어	영어	수학	총점	평균	학점");
		System.out.println("==============================");
		for(int i=0; i<scores.length; i++) {
			for(int j=0; j<scores[i].length-2; j++) {
				double avg = (double)(scores[i][j]+scores[i][j+1]+scores[i][j+2])/3;
				int total = (scores[i][j]+scores[i][j+1]+scores[i][j+2]);
				System.out.print(" "+(i+1)+"     "+scores[i][j]+"     "+scores[i][j+1]+"     "+scores[i][j+2]+"    "+total+"  "+String.format("%.2f", avg)+"    ");
				switch((int)avg/10) {
					case 10 : case 9 : System.out.println("A");
					break;
					case 8 : System.out.println("B");
					break;
					case 7 : System.out.println("C");
					break;
					case 6 : System.out.println("D");
					break;
					default : System.out.println("F");
				}
			}
		}
		System.out.println("==============================");
		for(int i=0; i<1; i++) {
			for(int j=0; j<scores.length; j++) {
				korTot += scores[j][0];
				engTot += scores[j][1];
				mathTot += scores[j][2];
			}
		}
		System.out.println("과목합 "+korTot+"   "+engTot+"   "+mathTot);
	}
}
