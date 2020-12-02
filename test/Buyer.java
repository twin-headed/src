package test;

public class Buyer {
	private int money;
	private int point;
	private String BuyerName;
	
	public Buyer(String BuyerName, int money) {
		this.BuyerName = BuyerName;
		this.money = money;
	}
	
	public void buy(ElectronicProducts product) {
		money -= product.getPrice()*(1-product.getSalePoint());	// 원래가격 * (1-할인율)
		point += (product.getPrice()*(1-product.getSalePoint()))*product.getBonusRatio(); // (원래가격 * (1-할인율) ) * 보너스포인트비율  
	}
	
	public void printInfo() {
		System.out.println("소지금: "+money);
		System.out.println("포인트: "+point);
		System.out.println("구매자이름: "+BuyerName);
	}
	
	
}
