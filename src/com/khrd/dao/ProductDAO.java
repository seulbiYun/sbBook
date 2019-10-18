package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.Product;
import com.khrd.dto.Type;
import com.khrd.jdbc.JdbcUtil;

public class ProductDAO {
	private static final ProductDAO dao = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return dao;
	}
	
	private ProductDAO() {}
	
	public List<Product> selectList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product join type using (t_no)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Product> list = new ArrayList<Product>();
			while(rs.next()) {
				Product prd = new Product(rs.getInt("p_no"),
										rs.getString("p_title"),
										rs.getString("p_name"),
										rs.getInt("p_price"),
										rs.getString("p_detail"),
										rs.getString("p_publisher"),
										rs.getDate("p_regdate"),
										rs.getString("p_file"),
										new Type(rs.getInt("t_no"), rs.getString("t_name")));
				list.add(prd);
			}
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return null;
	}
	public Product selectByNo(Connection conn,int no){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product join type using (t_no) where p_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Product prd = new Product(rs.getInt("p_no"),
										rs.getString("p_title"),
										rs.getString("p_name"),
										rs.getInt("p_price"),
										rs.getString("p_detail"),
										rs.getString("p_publisher"),
										rs.getDate("p_regdate"),
										rs.getString("p_file"),
										new Type(rs.getInt("t_no"), rs.getString("t_name")));
				return prd;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return null;
	}
}
