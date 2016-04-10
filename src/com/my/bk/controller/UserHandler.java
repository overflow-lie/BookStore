package com.my.bk.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.bk.entities.User;
import com.my.bk.service.i.UserService;

@Controller
@RequestMapping("/user")
//@SessionAttributes("loginUser")
public class UserHandler {

	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping(value="/loginCheckEmail",method=RequestMethod.POST)
	public Map<String,Object> loginCheckName(@RequestParam("uEmail") String uEmail){
		
		boolean checkUsername = userService.checkEmail(uEmail);
		Map<String,Object> map = new HashMap<String,Object>();
		if (checkUsername) {
			map.put("errorMsg", "该邮箱还未被注册");
		}else{
			map.put("errorMsg","");
		}
		return map;
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(){
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@RequestParam(value="uEmail", required=false) String uEmail, 
			@RequestParam(value="uPassword",required=false) String password,Map<String,Object> map,HttpSession session){
		
		Subject currentUser = SecurityUtils.getSubject();
		
		if (!currentUser.isAuthenticated()) {
		    UsernamePasswordToken token = new UsernamePasswordToken(uEmail, password);
		    token.setRememberMe(true);
		    
		    try {
		        currentUser.login(token);
		        Object user =SecurityUtils.getSubject().getPrincipals().getPrimaryPrincipal();
		        session.setAttribute("loginUser", user);
		        return "authorityView";
		    } catch (UnknownAccountException uae) {
		    	map.put("errorMsg","该邮箱还未被注册！");
		    	return "login";
		    } catch (IncorrectCredentialsException ice) {
		    	map.put("errorMsg","密码不正确！");
		    	return "login";
		    } catch (LockedAccountException lae) {
		    	map.put("errorMsg","用户被锁定，请联系管理员！");
		    	return "login";
		    }
		}
		return "redirect:/user/login";
		
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request,HttpSession session){
		session.removeAttribute("loginUser");
		return "redirect:/book/list/1";
	}
	
	@RequestMapping(value="/regist",method=RequestMethod.GET)
	public String regist(){
		return "regist";
	}
	
	@ResponseBody
	@RequestMapping(value="/registCheckName",method=RequestMethod.POST)
	public Map<String,Object> registCheckName(@RequestParam("name") String name){
		
		boolean checkUsername = userService.checkUserName(name);
		Map<String,Object> map = new HashMap<String,Object>();
		if (checkUsername) {
			map.put("errorMsg","");
		}else{
			map.put("errorMsg", "用户名已经存在！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/registCheckEmail",method=RequestMethod.POST)
	public Map<String,Object> checkEmail(@RequestParam("email") String email){
		
		boolean checkEmail = userService.checkEmail(email);
		Map<String,Object> map = new HashMap<String,Object>();
		if (checkEmail) {
			map.put("errorMsg", "");
		}else{
			map.put("errorMsg","您的邮箱已被注册！");
		}
		return map;
	}
	
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String regist(User user,@RequestParam("key") String key){
		System.out.println(user);
		System.out.println(key);
		userService.regist(user);
		return "redirect:/user/login";
	}
	
}
