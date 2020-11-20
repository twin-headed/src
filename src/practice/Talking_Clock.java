package practice;

public class Talking_Clock {

	public static void clock(String time) {
		
		String hours = "";
		String minutes = "";
		
		String[] hour2 = {"","one","two","three","four","five","six","seven","eight","nine"};
		String[] hour = {"one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve"};
		String[] twenty_fiftynine = {"twenty","thirty","fourty","fifthy"};
		String[] ten_ninteen = {"ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"};
		
		if(Integer.parseInt(time.substring(0, 2))>12) {
			hours = hour[Integer.parseInt(time.substring(0, 2))-13];
		} else if(Integer.parseInt(time.substring(0, 2))==0) {
			hours = hour[11];
		}
		else hours = hour[Integer.parseInt(time.substring(0, 2))-1];
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		if(Integer.parseInt(time.substring(3, 5))==0) {
			minutes = "";
		}else if(Integer.parseInt(time.substring(3, 5)) < 10) {
			minutes = "oh " + hour[Integer.parseInt(time.substring(3, 5))-1];
		}else if(Integer.parseInt(time.substring(3, 5)) < 20) {
			minutes = ten_ninteen[Integer.parseInt(time.substring(3, 5))-10];
		}else if(Integer.parseInt(time.substring(3, 5)) < 60) {
			if(Integer.parseInt(time.substring(3, 4)) == 2) {
				minutes = twenty_fiftynine[0] + hour2[Integer.parseInt(time.substring(4, 5))];
			}else if(Integer.parseInt(time.substring(3, 4)) == 3) {
				minutes = twenty_fiftynine[1] + hour2[Integer.parseInt(time.substring(4, 5))];
			}else if(Integer.parseInt(time.substring(3, 4)) == 4) {
				minutes = twenty_fiftynine[2] + hour2[Integer.parseInt(time.substring(4, 5))];
			}else minutes = twenty_fiftynine[3] + hour2[Integer.parseInt(time.substring(4, 5))];
		}
		
		if(Integer.parseInt(time.substring(0, 2))>11) {
			System.out.println("It's " + hours + " " + minutes + " pm");
		}else System.out.println("It's " + hours + " " + minutes + " am");
		
	}
	public static void main(String[] args) {

		clock("11:49");
		
		}
		
}

