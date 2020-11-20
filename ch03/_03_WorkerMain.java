package ch03;

public class _03_WorkerMain {
	public static void main(String[] args) {
		
		_03_Worker sc= new _03_Worker();
		
		int num1 = 20;
		int num2 = 10;
		
		System.out.println(sc.getTotal(num1,num2));
		System.out.println(sc.getAvg(sc.getTotal(num1,num2)));
	}
}
