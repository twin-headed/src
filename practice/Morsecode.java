package practice;
public class Morsecode {
	public static void SmooshedMorse(String word) {
	    String[] morsecode = ".- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --..".split(" ");
	    char[] alphabet = "abcdefghijklmnopqrstuvwxyz".toCharArray();
	    char[] code = word.toCharArray();

	    for(int i = 0; i < code.length; i++) {
	        for(int j = 0; j < alphabet.length; j++){
	            if(code[i] == alphabet[j]) {
	                System.out.print(morsecode[j]);
	            }
	        }
	    }
	}
	public static void main(String[] args) {
		
		SmooshedMorse("cab");
	}
	
	
	
}
