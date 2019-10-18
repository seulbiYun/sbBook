package com.khrd.handler.member;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.UserDAO;
import com.khrd.dto.User;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JdbcUtil;

public class MemberLoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/member/loginForm.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String uId = request.getParameter("uId");
			String uPassword = request.getParameter("uPassword");
						
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				UserDAO dao = UserDAO.getInstance();
				User user = dao.selectById(conn, uId);
				if(user == null) {//아이디가 존재하지 않을 경우
					request.setAttribute("IDnotMatch", true);
					return "/WEB-INF/view/member/loginForm.jsp";
				}
				if(!(user.getuPassword().equals(uPassword))) {//비밀번호 일치하지 않음
					request.setAttribute("PWnotMatch", true);
					return "/WEB-INF/view/member/loginForm.jsp";
				}
				
				HttpSession session = request.getSession();
				session.setAttribute("Auth", uId);
				response.sendRedirect(request.getContextPath() + "/product/list.do");
							
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(conn);
			}
		}
		return null;
	}

}
