package ch02;

public class _13_WhileEx {
	public static void main(String[] args) {
		int i = 2;
		int j = 1;
		while(i<10) {
			System.out.println("======="+i+"단"+"======");
			while(j<10) {
				System.out.println(i+"×"+j+"="+i*j);
				j++;
			}
			i++;
			j=1;
		}
	}
}
