package com.ict.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;
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
	
	// 리스트
	public static List<BVO> getList(){
		List<BVO> b_list = null;
		b_list=getSession().selectList("list");
		return b_list;
	}
	// 리스트
	public static List<BVO> getList(int begin, int end){
		List<BVO> b_list = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		b_list=getSession().selectList("plist",map);
		return b_list;
	}
	// 삽입
	public static int getInsert(BVO bvo) {
		int result = 0;
		result = getSession().insert("insert", bvo);
		ss.commit();
		return result;
	}
	// 조회수 업데이트 
	public static void getHit(String b_idx) {
		System.out.println(b_idx);
		getSession().update("updatehit", b_idx);
		ss.commit();
	}
	// 상세내용 가져오기 
	public static BVO getOneList(String b_idx){
		BVO bvo = null;
		bvo=getSession().selectOne("onelist", b_idx);
		return bvo;
	}
	// 삭제
	public static int getDelete(String b_idx) {
		int result= 0;
		result=getSession().delete("delete", b_idx);
		ss.commit();
		return result;
	}
	// 업데이트 
	public static int getUpdate(BVO bvo) {
		int result= 0;
		result = getSession().update("update", bvo);
		ss.commit();
		return result;
	}
	
	// 댓글리스트 가져오기
	public static List<CVO> getCList(String b_idx){
		List<CVO> clist = null;
		clist = getSession().selectList("clist", b_idx);
		return clist;
	}
	// 댓글 저장
	public static int getInsert_C(CVO cvo) {
		int result = 0;
		result=getSession().insert("insert_c", cvo);
		ss.commit();
		return result;
	}
	// 댓글데이터 삭제
	public static void getDeleteC(String c_idx) {
		getSession().delete("deleteC", c_idx);
		ss.commit();
	}
	
	// 전체 게시물의 수 구하기
	public static int getCount() {
		int result = 0 ;
		result =getSession().selectOne("count");
		return result;}
}








