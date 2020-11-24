package ch04;
//설계도
public class _02_Sungjuk {

	public int korean;
	public int english;
	public int math;
	//	국영수 합계
	public int getTotal() {
		int sum = korean + english + math;
		return sum;
	}
	//	국영수 평균
	public double getAvg() {
		double avg = (double)getTotal()/3;
		return avg;
	}
}
