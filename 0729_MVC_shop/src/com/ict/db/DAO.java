package com.ict.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

// DB처리하는 클래스
public class DAO {
	// MyBatis는 SqlSession클래스를 사용 
	private static SqlSession ss;
	
	// 싱글턴 패턴
	private synchronized static SqlSession getSession() {
		if(ss == null) {
			ss = DBService.getFactory().openSession(false);
		}
		return ss;
	}
	
	public static List<VO> getList(String category){
		List<VO> list = null;
		list = getSession().selectList("list", category);
		return list;
	}
	
	public static VO getOneList(String idx) {
		VO vo = null;
		vo = getSession().selectOne("onelist", idx);
		return vo;
	}
	public static MVO getLogIn(MVO mvo) {
		MVO m_vo = new MVO();
		m_vo = getSession().selectOne("login", mvo);
		return m_vo;
	}
	public static int getProductInsert(VO vo) throws Exception {
		int result = 0 ;
		result = getSession().insert("add",vo);
		return result;
	}
}








