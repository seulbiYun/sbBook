package com.khrd.handler.product;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ProductDAO;
import com.khrd.dto.Product;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JdbcUtil;

public class ProductDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sNo = request.getParameter("pNo");
		int no = Integer.parseInt(sNo);
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();
			Product prd = dao.selectByNo(conn, no);
			
			request.setAttribute("prd", prd);
			
			return "/WEB-INF/view/product/detail.jsp";	
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		return null;
	}

}
