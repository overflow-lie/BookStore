package com.my.bk.service.i;

import com.my.bk.entities.User;

public interface UserService {
	
	User login(String username);
	
	boolean regist(User user);
	
	boolean checkUserName(String username);

	boolean checkEmail(String email);

}
