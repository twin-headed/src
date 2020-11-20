package practice;

public class First_repeat {
	
	public static void main(String[] args) {
		
		int arr[] = {10,5,3,4,3,5,6,7,8,9,10};
		int [] count = new int[arr.length];
		
		// 중복된 숫자들을 찾는다. 중복된 숫자를 찾을시 해당 반복 continue
		// 중복된 숫자들의 첫 출현순서를 파악한다.
		
		for(int i=0; i<arr.length; i++) {
			for(int j=i+1; j<arr.length-1; j++) {
				int check = arr[i];
				if(check == arr[j+1]) count[i] = check;
					continue;
			}
		}
		for(int i=0; i<count.length; i++) {
				if(count[i]!=0) {
				System.out.println(count[i]+" is the first element that repeats.");
				break;
			}
		}
		
		
		
		
		
		
		
		
		
		
		
	}
}
