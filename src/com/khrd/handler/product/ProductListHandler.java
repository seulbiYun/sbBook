package com.khrd.handler.product;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ProductDAO;
import com.khrd.dto.Product;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JdbcUtil;

public class ProductListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();
			List<Product> list = dao.selectList(conn);
			
			request.setAttribute("list", list);
			return "/WEB-INF/view/product/list.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		
		return null;
	}

}
