package test;

public class E_Main {
	public static void main(String[] args) {
		ElectronicProducts notebook = new Notebook("apple",2000000,0.1,0.2,"macbook");
		Buyer blackcow = new Buyer("흑우",5000000);
		
		blackcow.printInfo();
		System.out.println("=============================");
		notebook.printInfo();
		System.out.println("=============================");
		blackcow.buy(notebook);
		blackcow.printInfo();
		
	}
}
