package test;

public class Notebook extends ElectronicProducts{

	private String modelName;	// 모델명
	
	public Notebook() {}
	
	public Notebook(String brandName, int price, double salePoint, double bonusRatio,String modelName) {
		super(brandName,price,salePoint,bonusRatio);
		this.modelName = modelName;
	}
	
	@Override
	public void printInfo() {
		super.printInfo();
		System.out.println("모델명: "+modelName);
	}
}
