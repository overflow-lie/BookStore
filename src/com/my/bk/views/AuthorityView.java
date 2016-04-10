package com.my.bk.views;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.View;

import com.my.bk.entities.User;

@Component
public class AuthorityView implements View{

	@Override
	public String getContentType() {
		return "text/html; charset=UTF-8";
	}

	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		User user =(User)session.getAttribute("loginUser");
		String state = user.getRole().getState();
		
		boolean equals = "MANAGER".equals(state);
		if (equals) {
			response.sendRedirect(request.getContextPath()+"/manager/home");
		}else{
			response.sendRedirect(request.getContextPath()+"/book/list/0");
		}
	}

}
