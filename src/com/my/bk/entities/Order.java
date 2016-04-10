package com.my.bk.entities;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7751463890167307304L;
	
	private String id;
	private Date orderTime;
	private int totalCount;
	private double totalAmount;
	private int state;
	private int userId;
	public Order() {
		super();
	}
	public Order(String id, Date orderTime, int totalCount,double totalAmount,int state, int userId) {
		super();
		this.id = id;
		this.orderTime = orderTime;
		this.totalAmount = totalAmount;
		this.totalCount = totalCount;
		this.state = state;
		this.userId = userId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", orderTime=" + orderTime + ", totalAmount=" + totalAmount + ", totalCount="
				+ totalCount + ", state=" + state + ", userId=" + userId + "]";
	}
	
}	