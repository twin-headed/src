package practice;

public class Additive_Persistence {
	
	public static int additive_persistence(int n) {
		int count = 0;
		while(String.valueOf(n).length()>1) {
			int sum = 0;
			for(int i =0; i<String.valueOf(n).length(); i++) {
				sum += Integer.parseInt(String.valueOf(n).substring(i, i+1));
			}
			count ++;
			n = sum;
		} return count;
	}
	public static void main(String[] args) {
		System.out.println(additive_persistence(199));
	}
}
