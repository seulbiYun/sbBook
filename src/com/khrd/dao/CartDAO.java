package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.khrd.dto.Cart;
import com.khrd.jdbc.JdbcUtil;

public class CartDAO {
	private static final CartDAO dao = new CartDAO();
	
	public static CartDAO getInstance() {
		return dao;
	}
	
	private CartDAO() {}
	
	public int insertCart(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into cart values(null,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getcCount());
			pstmt.setInt(2, cart.getProduct().getpNo());
			pstmt.setString(3, cart.getuId());
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
		}
		
		
		return -1;
	}
}
