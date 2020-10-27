package com.ict.network03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBConnection {
	Connection conn;
	PreparedStatement pstm;
	ResultSet rs;

	public DBConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@203.236.220.73:1521:xe";
			String user = "c##euni";
			String password = "1111";
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속성공");
		} catch (Exception e) {
			System.out.println(e + "4");
		}
	}

	// members의 전체 정보 보기
	public ArrayList<String> selectAll() {
		ArrayList<String> list = new ArrayList<String>();
		try {
			String sql = "select * from members order by idx";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				StringBuffer sb = new StringBuffer();
				sb.append(rs.getString("idx") + "\t");
				sb.append(rs.getString("m_id") + "\t");
				sb.append(rs.getString("m_pw") + "\t");
				sb.append(rs.getString("m_name") + "\t");
				sb.append(rs.getString("m_age") + "\t");
				sb.append(rs.getString("m_reg").substring(0, 10) + "\t");
				list.add(sb.toString());
			}
			System.out.println("정보가져오기 성공");
		} catch (Exception e) {
			System.out.println(e + "3");
		}
		return list;
	}
	// MyController에서 사용할 것 => MainActivity8
	public String selectAll2() {
		StringBuffer sb = new StringBuffer();
		try {
			String sql = "select * from members order by idx";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				sb.append(rs.getString("idx") + ",");
				sb.append(rs.getString("m_id") + ",");
				sb.append(rs.getString("m_pw") + ",");
				sb.append(rs.getString("m_name") + ",");
				sb.append(rs.getString("m_age") + ",");
				sb.append(rs.getString("m_reg").substring(0, 10) + "/");
			}
			System.out.println("정보가져오기 성공");
		} catch (Exception e) {
			System.out.println(e + "5");
		}
		return sb.toString();
	}
	// MyController2,3,4에서 사용할 것 => MainActivity9
	public ArrayList<VO> selectAll3() {
		ArrayList<VO> list = new ArrayList<VO>();
		try {
			String sql = "select * from members order by idx";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				VO vo = new VO();
				StringBuffer sb = new StringBuffer();
				vo.setIdx(rs.getString("idx"));
				vo.setM_id(rs.getString("m_id"));
				vo.setM_pw(rs.getString("m_pw"));
				vo.setM_name(rs.getString("m_name"));
				vo.setM_age(rs.getString("m_age"));
				vo.setM_reg(rs.getString("m_reg").substring(0,10));
				list.add(vo);
			}
			System.out.println("정보가져오기 성공");
		} catch (Exception e) {
			System.out.println(e + "6");
		}
		return list;
	}
}
