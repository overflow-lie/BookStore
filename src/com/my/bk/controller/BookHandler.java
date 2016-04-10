package com.my.bk.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.bk.entities.Book;
import com.my.bk.model.Page;
import com.my.bk.service.i.BookService;

@Controller
@RequestMapping("/book")
public class BookHandler {
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping("/list/{pageNoStr}")
	public String list(@PathVariable("pageNoStr") String pageNoStr,Map<String,Object> map){
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("pageNoStr", pageNoStr);
		params.put("pageSize", 2);
		Page<Book> page = bookService.findBook(params);
		
		List<Book> hotBooks = bookService.getHotBookList();
		
		map.put("page", page);
		map.put("hotBooks", hotBooks);
		
		return "book_list";
	}
}
