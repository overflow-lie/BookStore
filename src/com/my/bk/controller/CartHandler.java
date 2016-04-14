package com.my.bk.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.my.bk.entities.Book;
import com.my.bk.model.Page;
import com.my.bk.service.i.BookService;

@Controller
@RequestMapping("/cart")
public class CartHandler {
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping("/add/{pageNoStr}")
	public String add(@PathVariable("pageNoStr") String pageNoStr,Map<String,Object> map){
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("pageNoStr", pageNoStr);
		params.put("pageSize", 6);
		Page<Book> page = bookService.findBook(params);
		
		List<Book> hotBooks = bookService.getHotBookList();
		
		map.put("page", page);
		map.put("hotBooks", hotBooks);
		
		return "cart_add";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request){
		Map<String, Object> parametersStartingWith = WebUtils.getParametersStartingWith(request, "cart-");
		return "";
	}
}
