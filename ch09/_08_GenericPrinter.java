package ch09;

public class _08_GenericPrinter<T> {
	private T material;		// T자료형 변수
	
	public void setMaterial(T material) {
		this.material = material;
	}
	
	public T getMaterial() {
		return material;
	}
	
	@Override 
	public String toString() {
		return material.toString();
	}
	
	
	
	
	
}
