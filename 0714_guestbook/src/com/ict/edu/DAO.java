package com.ict.edu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private static DAO dao = new DAO();
	
	public static DAO getInstance() {
		return dao;
	}
	
	//접속
	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url ="jdbc:oracle:thin:@203.236.220.73:1521:xe";
			String user="c##euni";
			String password="1111";
			conn=DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
		}		
		return conn;
	}
	//방명록 전체 목록보기
	public ArrayList<VO> getGuestbook(){
		ArrayList<VO> list = new ArrayList<VO>();
		try {
			conn= getConnection();
			String sql = "select * from guestbook order by idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				VO vo = new VO();
				vo.setIdx(rs.getString("idx"));
				vo.setName(rs.getString("name"));
				vo.setSubject(rs.getString("subject"));
				vo.setRegdate(rs.getString("regdate"));
				list.add(vo);
			}
		} catch (Exception e) {
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return list;
	}
	//방명록 작성한 것 저장
	public int getWrite(String name, String subject, String content, String email, String pwd) {
		int result = 0;
		try {
			conn = getConnection();
			String sql = "insert into guestbook values(guestbook_seq.nextval,?,?,?,?,?,sysdate)";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, email);
			pstmt.setString(5, pwd);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
		}finally {
			try {
				
			} catch (Exception e2) {
			}
		}
		return result;
	}
	public int getWrite(VO vo) {
		int result = 0;
		try {
			conn = getConnection();
			String sql = "insert into guestbook values(guestbook_seq.nextval,?,?,?,?,?,sysdate)";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPwd());
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
		}finally {
			try {
				
			} catch (Exception e2) {
			}
		}
		return result;
	}
	//vo.idx로 해당 객체 찾기(select * from guestbook where idx=?)
	public VO getOneList(String idx) {
		VO vo1 = new VO();
		try {
			conn = getConnection();
			String sql = "select * from guestbook where idx=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo1.setIdx(rs.getString("idx"));
				vo1.setName(rs.getString("name"));
				vo1.setSubject(rs.getString("subject"));
				vo1.setEmail(rs.getString("email"));
				vo1.setContent(rs.getString("content"));
				vo1.setRegdate(rs.getString("regdate"));
				vo1.setPwd(rs.getString("pwd"));
			}
		} catch (Exception e) {
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return vo1;
	}
	//정보를 받아서 업데이트 하자
	public int getUpdate(VO vo) {
		int result =0;
		try {
			conn= getConnection();
			String sql = "update guestbook set name=?,subject=?,email=?,content=? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getIdx());
			result=pstmt.executeUpdate();
		} catch (Exception e) {
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return result;
	}
	//방명록삭제
	public int getDelete(VO vo) {
		int result=0;
		try {
			conn = getConnection();
			String sql="delete from guestbook where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getIdx());
			result=pstmt.executeUpdate();
		} catch (Exception e) {
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return result;
	}
}
