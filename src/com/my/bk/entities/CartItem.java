package com.my.bk.entities;

import java.io.Serializable;
import java.math.BigDecimal;

public class CartItem implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Book book;
	private int count = 1;

	//private String amount;
	
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getCount() {
		return count;
	}
	
	public void setCount(String count) {
		try {
			this.count = Integer.parseInt(count);
		} catch (Exception e) {
		}
	}
	
	public double getAmount() {
		
		BigDecimal count = new BigDecimal(getCount()+"");
		
		BigDecimal price = new BigDecimal(book.getPrice()+"");
		
		return count.multiply(price).doubleValue();
	}
	
	
	
	

}
