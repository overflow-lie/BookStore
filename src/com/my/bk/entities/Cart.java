package com.my.bk.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Cart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private Map<String,CartItem> cartMap = new LinkedHashMap<String,CartItem>();
	
	//private int totalCount;
	
	/**
	 * 购物车中商品的总金额
	 * 通过计算获得
	 */
	//private double totalAmount;
	
	//
	public void updateCount(){
		
	}
	
	//清空购物车
	public void clear(){
		cartMap.clear();
	}
	
	/**
	 * 删除一个购物项
	 */
	public void delCartItem(String bookId){
		//
		cartMap.remove(bookId);
	}
	
	public void addBook2Cart(Book book){
		CartItem item = cartMap.get(book.getId()+"");
		
		if (item==null) {
			
			item = new CartItem();
			
			item.setBook(book);
			
			item.setCount("1");
			cartMap.put(book.getId()+"",item);
		}else {
			
			int count = item.getCount();
			
			item.setCount(count+1+"");
		}
		
	}
	/**
	 * 获取购物车中的所有的购物项
	 * 
	 */
	public List<CartItem> getCartItem(){
		
		//
		Collection<CartItem> values =  cartMap.values();
		
		//
		return new ArrayList<CartItem>(values);
	}
	
	
	
	public Map<String, CartItem> getMap() {
		return cartMap;
	}

	public void setMap(Map<String, CartItem> map) {
		this.cartMap = map;
	}

	public int getTotalCount(){
		
		int totalCount = 0;
		
		List<CartItem> cartItems = getCartItem();
		
		for (CartItem cartItem : cartItems) {
			totalCount += cartItem.getCount();
		}
		
		return totalCount;
	}
	
	public double getTotalAmount(){
		
		BigDecimal totalAmount = new BigDecimal("0");
		List<CartItem> cartItems = getCartItem();
		
		for (CartItem cartItem : cartItems) {
			BigDecimal amount = new BigDecimal(cartItem.getAmount()+"");
			 
			totalAmount = totalAmount.add(amount);
		}
		
		return totalAmount.doubleValue();
	}
}
