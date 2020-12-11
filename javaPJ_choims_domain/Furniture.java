package javaPJ_choims_domain;

// DTO(Data Transfer Object)
public class Furniture implements Cloneable{

	// 멤버변수
	private String furnitureModel;		// 책 제목
	private String furnitureBrand;	// 책 저자
	private int furniturePrice;			// 책 가격
	private int furnitureCount;		// 책 수량
	private int goodsNum;
	
	// 생성자
	public Furniture () {}
	
	public Furniture (String furnitureModel, String furnitureBrand, int furniturePrice, int furnitureCount, int goodsNum) {
		this.furnitureModel = furnitureModel;
		this.furnitureBrand = furnitureBrand;
		this.furniturePrice = furniturePrice;
		this.furnitureCount = furnitureCount;
		this.goodsNum = goodsNum;
	}
	// getter, setter
	public String getFurnitureModel() {
		return furnitureModel;
	}
	public void setFurnitureModel(String furnitureModel) {
		this.furnitureModel = furnitureModel;
	}
	public String getFurnitureBrand() {
		return furnitureBrand;
	}
	public void setFurnitureBrand(String furnitureBrand) {
		this.furnitureBrand = furnitureBrand;
	}
	public int getFurniturePrice() {
		return furniturePrice;
	}
	public void setFurniturePrice(int furniturePrice) {
		this.furniturePrice = furniturePrice;
	}
	public int getFurnitureCount() {
		return furnitureCount;
	}
	public void setFurnitureCount(int furnitureCount) {
		this.furnitureCount = furnitureCount;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	
	// toString()
	@Override 
	public String toString() {
		return goodsNum +"   "+
	furnitureModel +"   "+ furnitureBrand +"   "+ furniturePrice +"    "+ furnitureCount; 
	}
	@Override
    public Object clone() throws CloneNotSupportedException{
    	return super.clone();
    }
	
}
