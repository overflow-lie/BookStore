package com.my.bk.mapper;

import org.apache.ibatis.annotations.Param;

import com.my.bk.entities.User;

public interface UserMapper {
    
	int countUserName(@Param("username")String uName);

	int countEmail(@Param("email")String email);

	int save(User user);

	User getUserByUserName(@Param("username")String username);

	User getUserByEmail(@Param("email")String email);
	
}