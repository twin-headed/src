package practice;

class Print {
	public String delimiter;
	public void a() {
		System.out.println(this.delimiter);
		System.out.println("a");
	}
	public void b() {
		System.out.println(this.delimiter);
		System.out.println("b");
	}
	public static void c(String delimiter) {
		System.out.println(delimiter);
		System.out.println("c");
	}
}

public class HelloWorld {
	
	public static String smorse(String String3) {
		String replace = "";
		for (int i =0; i<String3.length(); i++) {
			switch (String3.charAt(i)) {
			case 'a':
				replace += ".-";
				break;
			case 'b' :
				replace += "-...";
				break;
			case 'c' :
				replace += "-.-.";
				break;
			case 'd' :
				replace += "-..";
				break;
			case 'e' :
				replace += ".";
				break;
			case 'f' :
				replace += "..-.";
				break;
			case 'g' :
				replace	+= "--.";
				break;
			case 'h' :
				replace += "....";
				break;
			case 'i' :
				replace += "..";
				break;
			case 'j' :
				replace += ".---";
				break;
			case 'k' :
				replace += ".-..";
				break;
			case 'l' :
				replace += ".-..";
				break;
			case 'm' :
				replace += "--";
				break;
			case 'n' :
				replace += "-.";
				break;
			case 'o' :
				replace += "---";
				break;
			case 'p' :
				replace += ".--.";
				break;
			case 'q' :
				replace += "--.-";
				break;
			case 'r' :
				replace += ".-.";
				break;
			case 's' :
				replace += "...";
				break;
			case 't' :
				replace += "-";
				break;
			case 'u' :
				replace += "..-";
				break;
			case 'v' :
				replace += "...-";
				break;
			case 'w' :
				replace += ".--";
				break;
			case 'x' :
				replace += "-..-";
				break;
			case 'y' :
				replace += "-.--";
				break;
			case 'z' :
				replace += "--..";
				break;
			}
		}
		return replace;
	}
	
	public static boolean necklace(String String1, String String2) {
		
		boolean check = false;
		for(int i =0; i<String2.length(); i++) {
			char first = String2.charAt(0);
			String2 = String2.substring(1);
			String2 += first;
			if (String1.equals(String2)) {
				check = true;
				break;
			}
		}
		return check;
	}
	public static void main(String[] args) {
		//	클래스명은 대문자로 시작한다. 함수명은 소문자로 시작한다.
		//	대소문자 구분
		//	문장의 끝은 ; 으로 끝난다.
		// 	구현내용
		System.out.println("Fighting"); //	콘솔창 출력은 out 입력은 in , System도 대문자로 시작
		System.out.println("아자아자 화이팅");
		System.out.println(necklace("nicole","icolen"));
		
		Print forev = new Print();
		forev.delimiter = "-";
		forev.a();
		forev.b();
		Print.c("march");
		
		System.out.println(smorse("sos"));
		
		
	}
}
