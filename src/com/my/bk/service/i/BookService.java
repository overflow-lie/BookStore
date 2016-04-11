package com.my.bk.service.i;


import java.util.List;
import java.util.Map;

import com.my.bk.entities.Book;
import com.my.bk.model.Page;

public interface BookService {
	
	Page<Book> findBook(Map<String,Object> params);
	
	List<Book> getHotBookList();

	Book getBookById(String bookId);

	void updateBook(Book book);
}
