package com.ict.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


// DB처리하는 클래스
public class DAO {
	// MyBatis는 SqlSession 클래스를 사용
	private static SqlSession ss;
	
	// 싱글턴 패턴
	private synchronized static SqlSession getSession() {
		if (ss==null) {
			// 커밋은 select에는 의미가 없다.
			
			// 자동 커밋 안됨 : 개발자가 커밋 명령을 해야된다. 
			//			    나중에 트랜젝션 처리할때 필요하다.
			//ss=DBService.getFactory().openSession();
			//ss=DBService.getFactory().openSession(false);
			// 자동 커밋 됨
			//ss=DBService.getFactory().openSession(true);
			
			ss=DBService.getFactory().openSession(false);
		}
		return ss;	
	}
	
	public static List<VO> getList(){
		List<VO> list = null;
		list = getSession().selectList("list");
		return list;
	}
	public static void getInsert(VO vo) {
		getSession().insert("insert", vo);
		ss.commit();
	}
	public static VO getOnelist(String idx) {
		VO vo = null;
		vo=getSession().selectOne("onelist", idx);
		return vo;
	}
	public static void getDelete(String idx) {
		getSession().delete("delete", idx);
		ss.commit();
	}
	public static void getUpdate(VO vo) {
		getSession().update("update", vo);
		ss.commit();
	}
	
}
