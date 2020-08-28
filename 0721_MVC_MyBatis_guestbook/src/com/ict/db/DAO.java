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
	
	// SqlSession을 이용해서 DB처리
	// 리스트 : select문 결과가 여러개이므로 반환형 list<VO>
	// 		  select문 결과가 여러개이므로 반환형 VO
	public static List<VO> getList(){
		List<VO> list = null;
		// 여러개일때
		//list = getSession().selectList("mapper의 id");
		//list = getSession().selectList("mapper의 id",파라미터);
		// 하나일때
		//VO = getSession().selectOne("mapper의 id");
		//VO = getSession().selectOne("mapper의 id",파라미터);
		//mapper.xml에 id가 list인 태그를 찾아서 실행
		list = getSession().selectList("list");
		ss.commit();
		return list;
	}
	public static int getInsert(VO vo) {
		int result = 0;
		result = getSession().insert("insert", vo);
		ss.commit();
		return result;
	}
	public static VO getOneList(String idx) {
		VO vo = new VO();
		vo = getSession().selectOne("onelist", idx);
		return vo;
	}
	public static int getDelete(VO vo) {
		int result = 0;
		result = getSession().delete("delete", vo.getIdx());
		ss.commit();
		return result;
	}
	public static int getUpdate(VO vo) {
		int result = 0;
		result = getSession().update("update", vo);
		ss.commit();
		return result;
	}
}
