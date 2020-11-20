package ch02;

class Accounting {
	// 공급가액
    public static double valueOfSupply;
    // 부가가치세율
    public static double vatRate = 0.1;
 
    public static double getVAT() {
        return valueOfSupply * vatRate;
    }
     
    public static double getTotal() {
        return valueOfSupply + getVAT();
    }
}
public class AccountingApp {
	    public static void main(String[] args) {
	    	Accounting a1 = new Accounting();
	    	a1.valueOfSupply = 10000.0;
	    	
	    	Accounting a2 = new Accounting();
	    	a2.valueOfSupply = 20000.0;
	    	
	    	System.out.println(a1.valueOfSupply);
	    	System.out.println(a2.valueOfSupply);
	        
	    	
	    	
	    }
}
