package practice;

public class Perfectly_Balanced {
	
	
	public static void balanced(String text) {
		
		int count1 = text.length() - text.replace("y", "").length();
		int count2 = text.length() - text.replace("x", "").length();
		
		if(count1==count2) {
			System.out.println("True");
		}else System.out.println("False");
	}
	
	public static void main(String[] args) {
		
		balanced("xyxy");
		
		
	}
}
