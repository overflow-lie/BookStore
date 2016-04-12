package com.my.bk.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.my.bk.entities.Book;
import com.my.bk.model.Page;
import com.my.bk.service.i.BookService;
import com.my.bk.utils.PageUtils;

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
	public String booklist(HttpServletRequest request,@PathVariable("pageNoStr") String pageNoStr,Map<String,Object> map){
		
		Map<String, Object> params = WebUtils.getParametersStartingWith(request, "search_");
		String queryString = PageUtils.encodeParamsToQueryString(params);
		Page<Book> page = bookService.getBooksFromManager(pageNoStr,params);
		page.setPath("/manager/book/list");
		map.put("page", page);
		map.put("queryString", queryString);
		return "admin/book_list";
	}
	
	@ResponseBody
	@RequestMapping(value="/book/{bookId}",method=RequestMethod.GET)
	public Book updateBook(@PathVariable("bookId") String bookId){
		Book book = bookService.getBookById(bookId);
		return book;
	}
	
	@RequestMapping(value="/book",method=RequestMethod.POST)
	public String addBook(Book book){
		bookService.addBook(book);
		return "redirect:/manager/book/list/0";
	}
	
	@RequestMapping(value="/book",method=RequestMethod.PUT)
	public String updateBook(Book book){
		bookService.updateBook(book);
		return "redirect:/manager/book/list/0";
	}
	
	@RequestMapping(value="/book/{bookId}",method=RequestMethod.DELETE)
	public String delBook(@PathVariable("bookId") String bookId){
		bookService.deleteBook(bookId);
		return "redirect:/manager/book/list/0";
	}
	
	@ModelAttribute
	public void getBook(@RequestParam(value="id",required=false)String id,Map<String,Object> map){
		if (id != null) {
			map.put("book", bookService.getBookById(id));
		}
		map.put("book", new Book());
	}
}
