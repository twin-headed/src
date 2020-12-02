package test;

public class _13_Car {

	public static int count;
	private String brand;
	private String modelName;
	private String color;

	_13_Car() {
		count++;
	}
	
	_13_Car(String brand, String modelName, String color) {
		this.brand = brand;
		this.modelName = modelName;
		this.color = color;
		count++;
	}

	public void printInfo() {
		System.out.println(count);
		System.out.println(modelName);	
		System.out.println(color);
		System.out.println(count);
	}
}