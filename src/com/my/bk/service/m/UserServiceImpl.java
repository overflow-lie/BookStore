package com.my.bk.service.m;

import java.util.UUID;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.my.bk.entities.Role;
import com.my.bk.entities.User;
import com.my.bk.mapper.UserMapper;
import com.my.bk.service.i.UserService;

@Service
@Transactional(readOnly=true)
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	public User login(String email){
		User loginUser = userMapper.getUserByEmail(email);
		return loginUser;
	}
	
	@Override
	public boolean regist(User user) {
		String salt = UUID.randomUUID().toString().substring(0, 8);
		user.setuSalt(salt);
		
		String hashAlgorithmName = "MD5";
		int hashIterations = 1024;
		Object password = new SimpleHash(hashAlgorithmName,user.getuPassword(),ByteSource.Util.bytes(salt.getBytes()),hashIterations);
		System.out.println(password);
		user.setuPassword(password.toString());
		Role role = new Role();
		role.setId(1);
		user.setRole(role);
		return userMapper.save(user)==0;
		
	}

	@Override
	public boolean checkUserName(String username) {

		return userMapper.countUserName(username)==0;
	}

	@Override
	public boolean checkEmail(String email) {
		
		return userMapper.countEmail(email)==0;
	}

}
