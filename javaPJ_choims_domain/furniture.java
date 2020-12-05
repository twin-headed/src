package javaPJ_choims_domain;

// DTO(Data Transfer Object)
public class furniture {

	// 멤버변수
	private String furnitureModel;		// 책 제목
	private String furnitureBrand;	// 책 저자
	private int furniturePrice;			// 책 가격
	private int furnitureCount;		// 책 수량
	
	// 생성자
	furniture () {}
	
	furniture (String furnitureModel, String furnitureBrand, int furniturePrice, int furnitureCount) {
		this.furnitureModel = furnitureModel;
		this.furnitureBrand = furnitureBrand;
		this.furniturePrice = furniturePrice;
		this.furnitureCount = furnitureCount;
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
	
	// toString()
	@Override 
	public String toString() {
		return "가구모델명 : " + furnitureModel + "가구브랜드 :" + furnitureBrand + "가구가격 : " + furniturePrice + "가구수량 : " + furnitureCount; 
	}
	
}
