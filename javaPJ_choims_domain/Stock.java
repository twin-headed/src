package javaPJ_choims_domain;

import java.util.HashMap;

public class Stock {
	
	private static HashMap<Integer,Furniture> stock = new HashMap<Integer,Furniture>();
	
	public static HashMap<Integer, Furniture> getStock() {
		return stock;
	}
	
}
