package com.example.demo.board;

import java.sql.*;
import java.util.*;
import my.db.ConnectionPoolBean;
import my.member.MemberDTO;

//dao
public class BoardDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	private ConnectionPoolBean pool;
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public List<BoardDTO> makeList(ResultSet rs) throws SQLException {
		List<BoardDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			BoardDTO dto = new BoardDTO();
			
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			list.add(dto);
		}
		return list;
	}
	
	public List<BoardDTO> ListBoard() throws SQLException{
		try {			
        sql = "select * from board";
		ps = con.prepareStatement(sql); 	// sql 문의 결과를 가져옴
		ResultSet rs = ps.executeQuery();	// rs 쿼리 문의 결과를 담음	
		
		List<BoardDTO> list = makeList(rs);
		return list;
		
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
}
