package com.my.bk.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.bk.entities.Book;
import com.my.bk.model.Page;
import com.my.bk.service.i.BookService;

@Controller
@RequestMapping("/manager")
public class ManagerHandler {
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(){
		return "admin/manager";
	}
	
	@RequestMapping("/book/list/{pageNoStr}")
	public String booklist(@PathVariable("pageNoStr") String pageNoStr,Map<String,Object> map){
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("pageNoStr", pageNoStr);
		params.put("pageSize", 2);
		Page<Book> page = bookService.findBook(params);
		page.setPath("manager/book/list/");
		map.put("page", page);
		return "admin/book_list";
	}
}
