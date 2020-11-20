package ch02;

public class _25_ForEx {
	public static void main(String[] args) {
		
		String str = "no pain no gain";
		//	str	문자열 중 'n'가 몇번 나올까? 
		int count = str.length() - str.replace("n", "").length();
		System.out.println("n이 나오는횟수 : "+count);
		System.out.println("문장의 길이 : " + str.length());
		//	출력 => str의 길이
		
		count = 0;
		str.length();
		
		for(int i=0; i<=str.length(); i++) {
			if(str.charAt(i) !='n')
					continue;

			count++;
		}
		
		
	}
}
