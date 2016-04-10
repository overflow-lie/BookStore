package com.my.bk.realms;

import java.util.Collection;
import java.util.HashSet;

import javax.annotation.PostConstruct;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.my.bk.entities.Authority;
import com.my.bk.entities.User;
import com.my.bk.service.i.UserService;

@Component
public class UserRealm extends AuthorizingRealm{

	@Autowired
	private UserService userService;
	
	// 进行授权(看用户是否有某一个权限)的方法
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		Object principal = principalCollection.getPrimaryPrincipal();
		User user = (User)principal;
		//2. 创建 SimpleAuthorizationInfo 对象
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		//3. 调用 SimpleAuthorizationInfo#addRoles(Collection<String>); 添加用户所有的权限
		Collection<String> roles = new HashSet<>();
		for(Authority authority: user.getRole().getAuthorities()){
			roles.add(authority.getName());
		}
		info.addRoles(roles);
		return info;
	}

	// 进行认证(登陆)的方法
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		String email = token.getUsername();
		User user = userService.login(email);
		if (user == null) {
			return null;
		}
		Object principal = user;
		Object hashedCredentials = user.getuPassword();
		ByteSource credentialsSalt = ByteSource.Util.bytes(user.getuSalt());
		String realmName = getName();
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal, hashedCredentials, credentialsSalt, realmName);
		return info;
	}
	
	//相当于 init-method. 构造器被调用后, 属性被初始化完成后, 被调用
	@PostConstruct
	public void initCredentialsMatcher(){
		HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
		credentialsMatcher.setHashAlgorithmName("MD5");
		credentialsMatcher.setHashIterations(1024);
		//设置凭证的匹配方式. 
		setCredentialsMatcher(credentialsMatcher);
	}
}
