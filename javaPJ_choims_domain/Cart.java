package javaPJ_choims_domain;

import java.util.HashMap;

public class Cart {

	private static HashMap<Integer,Furniture> cart = new HashMap<Integer,Furniture>();
	
	public static HashMap<Integer, Furniture> getCart() {
		return cart;
	}
}
