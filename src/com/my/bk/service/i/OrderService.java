package com.my.bk.service.i;


import java.util.List;

import com.my.bk.entities.Cart;
import com.my.bk.entities.Order;
import com.my.bk.entities.OrderItem;
import com.my.bk.entities.User;

public interface OrderService {
	
	/**
	 * 生成订单并返回订单号
	 * @param cart
	 * @param user
	 * @return
	 */
	String createOrder(Cart cart,User user);
	
	/**
	 * 根据用户的id查询订单
	 * @param userId
	 * @return
	 */
	List<Order> getOrderListByUserId(String userId);
	
	/**
	 * 根据订单号获取所有的订单项
	 * @param orderId
	 * @return
	 */
	List<OrderItem> getOrderItemList(String orderId);
	
	/**
	 * 查询所有的订单
	 * @return
	 */
	List<Order> getOrderList();
	
	/**
	 * 发货的方式，有管理员调用
	 * @param orderId
	 */
	void sendBook(String orderId);
	
	/**
	 * 收货的方法，有普通用户调用
	 * @param orderId
	 */
	void takeBook(String orderId);
}
