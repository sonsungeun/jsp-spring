package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {
	Connection conn;
	PreparedStatement pstm;
	ResultSet rs;
	
	//싱글톤패턴
	private static DAO dao = new DAO();
	public static DAO getInstance() {
		return dao;
	}
	
	//접속
	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="c##euni";
			String password="1111";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
		}
		return conn;
	}
	
	public ArrayList<VO> getList(){
		ArrayList<VO> list = new ArrayList<VO>();
		try {
			conn = getConnection();
			String sql = "select * from guestbook order by idx";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				VO vo = new VO();
				vo.setName(rs.getString("name"));
				vo.setSubject(rs.getString("subject"));
				vo.setEmail(rs.getString("email"));
				vo.setPwd(rs.getString("pwd"));
				vo.setContent(rs.getString("content"));
				vo.setIdx(rs.getString("idx"));
				vo.setRegdate(rs.getString("regdate"));
				list.add(vo);
			}
		} catch (Exception e) {
		}finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return list;
	}
	
	public int getWrite(VO vo) {
		int result=0;
		try {
			conn = getConnection();
			String sql = "insert into guestbook values(guestbook_seq.nextval,?,?,?,?,?,sysdate)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, vo.getName());
			pstm.setString(2, vo.getSubject());
			pstm.setString(3, vo.getContent());
			pstm.setString(4, vo.getEmail());
			pstm.setString(5, vo.getPwd());
			result = pstm.executeUpdate();
		} catch (Exception e) {
		}finally {
			try {
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return result;
	}
	
	public VO getOnelist(String idx) {
		VO vo = new VO();
		try {
			conn = getConnection();
			String sql = "select * from guestbook where idx=?";
			pstm=conn.prepareStatement(sql);
			pstm.setString(1, idx);
			rs = pstm.executeQuery();
			while(rs.next()) {
				vo.setName(rs.getString("name"));
				vo.setSubject(rs.getString("subject"));
				vo.setEmail(rs.getString("email"));
				vo.setPwd(rs.getString("pwd"));
				vo.setContent(rs.getString("content"));
				vo.setIdx(rs.getString("idx"));
				vo.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
		}finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return vo;
	}
	public int getDelete(VO vo) {
		int result=0;
		try {
			conn = getConnection();
			String sql = "delete from guestbook where idx=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, vo.getIdx());
			result=pstm.executeUpdate();
		} catch (Exception e) {
		}finally {
			try {
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return result;
	}
	public int getUpdate(VO vo) {
		int result=0;
		try {
			conn = getConnection();
			String sql = "update guestbook set name=?,subject=?,content=?,email=? where idx=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, vo.getName());
			pstm.setString(2, vo.getSubject());
			pstm.setString(3, vo.getContent());
			pstm.setString(4, vo.getEmail());
			pstm.setString(5, vo.getIdx());
			result = pstm.executeUpdate();
		} catch (Exception e) {
		}finally {
			try {
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return result;
	}
}
