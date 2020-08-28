package com.ict.db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.SqlSession;

import com.ict.model.Paging;

// DB처리하는 클래스
public class DAO {
	// MyBatis는 SqlSession클래스를 사용
	private static SqlSession ss;

	// 싱글턴 패턴
	private synchronized static SqlSession getSession() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(false);
		}
		return ss;
	}
	
	// 전체 게시글의 수
	public static int getCount() {
		int result = 0;
		result=getSession().selectOne("count");
		return result;
	}
	
	public static List<VO> getList(Paging paging) {
		List<VO> list = null;
		list = getSession().selectList("list", paging);
		return list;
	}
	public static int getInsert(VO vo) {
		int result = 0;
		result=getSession().insert("insert", vo);
		ss.commit();
		return result;
	}
	
	public static VO getOnelist(String idx) {
		VO vo = null;
		vo=getSession().selectOne("onelist", idx);
		return vo;
	}
	
	public static void getCount(String idx) {
		getSession().update("hit", idx);
		ss.commit();
	}
	
	public static void getUpdate(VO vo) {
		getSession().update("update", vo);
		ss.commit();
	}
	
	// 기존 원글에 달려있는 댓글의 lev를 업데이트
	public static void getUP_lev(Map<String, Integer> map) {
		getSession().update("lev_up", map);
		ss.commit();
	}
	
	public static int getAns_Insert(VO vo) {
		int result = 0;
		result=getSession().insert("ans_insert", vo);
		ss.commit();
		return result;
	}
}
