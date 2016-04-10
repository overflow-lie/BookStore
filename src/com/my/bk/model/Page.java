package com.my.bk.model;

import java.util.List;

public class Page<T> {
	
	private int pageNo;
	private int pageSize=2;
	
	private int totalElements;
	private List<T> content;
	
	private String path;
	public int getPreIndex(){
		return (this.getPageNo()-1)*this.getPageSize();
	}
	
	public void setPageNo(String pageNumber) {
		this.pageNo = 1;
		
		try{
			int pageNo = Integer.parseInt(pageNumber);
			if(pageNo < 1){
				return;
			}
			this.pageNo = pageNo;
		}catch(Exception e){}
		
	}
	
	//之后使用 pageNo, 直接使用 getter 方法, 而不再使用 pageNo 属性
	public int getPageNo() {
		//检验 pageNo 的合法性
		if(this.pageNo > this.getTotalPages()){
			this.pageNo = this.getTotalPages();
		}
		return pageNo;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setTotalElements(int totalElements) {
		this.totalElements = totalElements;
	}
	
	public int getTotalElements() {
		return totalElements;
	}
	
	public void setContent(List<T> content) {
		this.content = content;
	}
	 
	public List<T> getContent() {
		return content;
	}
	
	//JavaBean 的属性. 以 getter 方法的方式来暴漏
	//总页数
	public int getTotalPages(){
		int totalPages = this.totalElements / this.pageSize;
		if(this.totalElements % this.pageSize != 0){
			totalPages++;
		}
		
		return totalPages;
		//return (this.totalElements + this.pageSize - 1) / this.pageSize;
	}
	
	//是否存在下一页
	public boolean isHasNext(){
		return this.getPageNo() < this.getTotalPages();
	}
	
	//返回下一页
	public int getNextPage(){
		if(isHasNext()){
			return this.getPageNo() + 1;
		}
		return this.getPageNo();
	}
	
	//是否存在上一页
	public boolean isHasPrev(){
		return this.getPageNo() > 1;
	}
	
	//返回上一页
	public int getPrevPage(){
		if(isHasPrev()){
			return this.getPageNo() - 1;
		}
		return 1;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	
}
