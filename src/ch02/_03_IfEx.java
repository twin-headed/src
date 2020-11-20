package ch02;

public class _03_IfEx {
	
	public static void test_result(int num) {
		String result = "";
		if(num >= 60) {
			result = "합격입니다.";
		} else if(num < 40) {
			result = "과락입니다.";
		} else result = "불합격입니다.";
		System.out.println(result);
	}
	public static void main(String[] args) {
		String result = "";
		int score = 50;
		if(score >= 60) {
			result = "합격입니다.";
		} else if(score < 40) {
			result = "과락입니다.";
		} else result = "불합격입니다.";
		System.out.println(result);
		test_result(50);
	}
}
