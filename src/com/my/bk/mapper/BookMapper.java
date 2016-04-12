package com.my.bk.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.my.bk.entities.Book;

public interface BookMapper {
   
	public List<Book> getBooks(Map<String,Object> map);
	
	public int getTotalBooksNo();

	public List<Book> getHotBooks();

	public Book getBookById(@Param("bookId")String bookId);

	public void updateBook(Book book);

	public void delBook(@Param("bookId")String bookId);
	
	public List<Book> getBooksFromManager(Map<String,Object> map);
	
	public int getTotalBooksNoForManager(Map<String,Object> map);
}