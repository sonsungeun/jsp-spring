package com.ict.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		ss.commit();
		return result;
	}
	
	// id와 제품번호를 이용해서 카트리스트를 구하자
	public static CVO getCartList(String id, String p_num) {
		CVO cvo = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("p_num", p_num);
		cvo = getSession().selectOne("cartlist", map);
		return cvo;
	}
	public static void getCartInsert(CVO c_vo) {
		getSession().insert("cartinsert", c_vo);
		ss.commit();
	}
	public static void getCartUpdate(CVO cvo) {
		getSession().update("cartupdate", cvo);
		ss.commit();
	}
	public static List<CVO> getAllCartList(String id){
		List<CVO> clist= null;
		clist = getSession().selectList("allcartlist", id);
		return clist;		
	}
	public static void getCartCountUpdate(CVO cvo) {
		getSession().update("cartup", cvo);
		ss.commit();
	}
	public static void getCartDel(CVO cvo) {
		getSession().delete("cartdel", cvo);
		ss.commit();
	}
}








