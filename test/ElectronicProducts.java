package test;

public class ElectronicProducts {

	private String brandName;																// 브랜드명
	private int price;																				// 가격
	private double salePoint;																	// 할인율
	private double bonusRatio;																// 보너스포인트 비율
	private int bonusPoint;																		// 보너스포인트 = (가격*(1-할인율)) * 보너스포인트 비율
	
	public ElectronicProducts () {}
	
	public ElectronicProducts(String brandName, int price, double salePoint,double bonusRatio) {
		this.brandName = brandName;
		this.price = price;
		this.salePoint = salePoint;
		this.bonusRatio = bonusRatio;
		this.bonusPoint = (int) ((price*(1-salePoint))*bonusRatio);
	}
	
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getBrandName() {
		return this.brandName;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPrice() {
		return this.price;
	}
	
	public void setSalePoint(double salePoint) {
		this.salePoint = salePoint;
	}
	public double getSalePoint() {
		return this.salePoint;
	}
	
	public void setBonusPoint(int bonusPoint) {
		this.bonusPoint = bonusPoint;
	}
	public int getBonusPoint() {
		return this.bonusPoint;
	}
	
	public void setBonusRatio(double bonusRatio) {
		this.bonusRatio = bonusRatio;
	}
	public double getBonusRatio() {
		return this.bonusRatio;
	}
	
	public void printInfo() {
		System.out.println("브랜드명: "+brandName);
		System.out.println("가격: "+price);
		System.out.println("할인율: "+salePoint);
		System.out.println("적립포인트 : "+bonusPoint);
		System.out.println("적립포인트비율: "+bonusRatio);
	}
	
	
	
}
