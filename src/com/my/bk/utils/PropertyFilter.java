package com.my.bk.utils;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
public class PropertyFilter {
	
	public static Map<String, Object> parseRequestParams2MybatisParams(Map<String, Object> requestParams){
		List<PropertyFilter> filters = parseRequestParmasToFilters(requestParams);
		return parseFiltersToMybatisParams(filters);
	}
	
	//把请求参数的 Map 转为 PropertyFilter 的集合
	public static List<PropertyFilter> parseRequestParmasToFilters(Map<String, Object> params){
		List<PropertyFilter> filters = new ArrayList<>();
		
		if(params != null
				&& params.size() > 0){
			for(Map.Entry<String, Object> entry: params.entrySet()){
				String key = entry.getKey();  //EQD_createDate
				Object propertyValue = entry.getValue();  //1990-12-12
				
				if(propertyValue == null || propertyValue.toString().trim().equals("")){
					continue;
				}
				
				//EQD
				String str1 = StringUtils.substringBefore(key, "_"); 
				//EQ
				String matchTypeCode = StringUtils.substring(str1, 0, str1.length() - 1);
				MatchType matchType = Enum.valueOf(MatchType.class, matchTypeCode);
				//D
				String propertyTypeCode = StringUtils.substring(str1, str1.length() - 1);
				Class propertyType = Enum.valueOf(PropertyType.class, propertyTypeCode).getPropertyType();
				
				//createDate
				String propertyName = StringUtils.substringAfter(key, "_");
				
				PropertyFilter filter = new PropertyFilter(propertyName, propertyValue, matchType, propertyType);
				filters.add(filter);
			}
		}
		
		return filters;
	}
	
	//把 PropertyFilter 的集合转为 mybatis 可用的 Map 类型的对象
	public static Map<String, Object> parseFiltersToMybatisParams(List<PropertyFilter> filters){
		Map<String, Object> params = new HashMap<String, Object>();
		//1. 遍历 filters
		for(PropertyFilter filter: filters){
			//2. 把 propertyVal 转为 propertyType 对应的 propertyVal. 
			Class propertyType = filter.getPropertyType();
			Object propertyVal = filter.getPropertyVal();
			propertyVal = ReflectionUtils.convertValue(propertyVal, propertyType);
			
			//3. 若 matchType 为 LIKE, 则在 propertyVal 前后加 %
			MatchType matchType = filter.getMatchType();
			if(matchType.equals(MatchType.LIKE)){
				propertyVal = "%" + propertyVal + "%";
			}
			
			String propertyName = filter.getPropertyName();
			params.put(propertyName, propertyVal);
		}
		
		return params;
	}
	
	//属性名
	private String propertyName;
	//属性值
	private Object propertyVal;
	//匹配方式
	private MatchType matchType;
	//属性的类型
	private Class propertyType;
	
	public PropertyFilter(String propretyName, Object propertyVal,
			MatchType matchType, Class propertyType) {
		this.propertyName = propretyName;
		this.propertyVal = propertyVal;
		this.matchType = matchType;
		this.propertyType = propertyType;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public Object getPropertyVal() {
		return propertyVal;
	}

	public MatchType getMatchType() {
		return matchType;
	}

	public Class getPropertyType() {
		return propertyType;
	}

	//比较的方式
	public enum MatchType{
		LIKE, GT, LT, GE, LE, EQ;
	}
	
	//目标属性的类型. 
	public enum PropertyType{
		I(Integer.class), D(Date.class), L(Long.class), S(String.class), F(Float.class);
		
		private Class propertyType;
		
		public Class getPropertyType(){
			return propertyType;
		}
		
		private PropertyType(Class propertyType){
			this.propertyType = propertyType;
		}
	}

	@Override
	public String toString() {
		return "PropertyFilter [propertyName=" + propertyName
				+ ", propertyVal=" + propertyVal + ", matchType=" + matchType
				+ ", propertyType=" + propertyType + "]";
	}
}
