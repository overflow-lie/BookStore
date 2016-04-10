package com.my.bk.service.m;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.my.bk.entities.Book;
import com.my.bk.mapper.BookMapper;
import com.my.bk.model.Page;
import com.my.bk.service.i.BookService;

@Service
@Transactional(readOnly=true)
public class BookServiceImpl implements BookService{

	@Autowired
	private BookMapper bookMapper;
	
	@Override
	public Page<Book> findBook(Map<String,Object> params) {
		
		String pageNumber = (String)params.get("pageNoStr");
		Integer pageSize = (Integer)params.get("pageSize");
		int totalRecordNo = bookMapper.getTotalBooksNo();
		Page<Book> page = new Page<Book>();
		page.setTotalElements(totalRecordNo);
		page.setPageSize(pageSize);
		page.setPageNo(pageNumber);
		
		int index = page.getPreIndex();
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("index", index);
		map.put("pageSize", pageSize);
		
		List<Book> list = bookMapper.getBooks(map);
		
		page.setContent(list);
		
		return page;
	}

	@Override
	public List<Book> getHotBookList() {
		List<Book> hotBooks =  bookMapper.getHotBooks();
		
		return hotBooks;
	}


	

}
