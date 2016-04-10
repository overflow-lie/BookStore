package com.my.bk.mapper;

import java.util.List;
import java.util.Map;

import com.my.bk.entities.Book;

public interface BookMapper {
   
	public List<Book> getBooks(Map<String,Object> map);
	
	public int getTotalBooksNo();

	public List<Book> getHotBooks();
}