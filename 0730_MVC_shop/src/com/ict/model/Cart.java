package com.ict.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.ict.db.DAO;
import com.ict.db.VO;

public class Cart {
	static List<VO> cartlist ; // 카트에 담겨질 제품 리스트
	static int total ;         // 카드에 전체 금액
	static {
		cartlist = new ArrayList<VO>();
	}
	
	// 카트에 해당 제품이 있는지 없는지 검사하는 메소드
	public static VO findProduct(String idx) {
		VO cvo = null;
		Iterator<VO> it = cartlist.iterator();
		while(it.hasNext()) {
		VO vo = it.next();
		if(vo.getIdx() == Integer.parseInt(idx)) {
				cvo = vo;
				break;
			}
		}
		return cvo;
	}
	
    // 제품을 카트에 담기
	public static void addProduct(String idx) {
		VO cvo = findProduct(idx);
		
		if(cvo != null) {
			// 카트에 있는 현재 갯수를 증가 
			cvo.setQuant(cvo.getQuant()+1);
			total = total + cvo.getP_saleprice();
		}else {
			// 카트에 담기 
			VO vo = DAO.getOneList(idx);
			vo.setQuant(1);
			total = total + vo.getP_saleprice();
			cartlist.add(vo);
		}
	}
	
	// 카트에서 제품을 삭제 할 경우
	public static void delProduct(String idx) {
		VO cvo = findProduct(idx);
		if(cvo != null) {
			cartlist.remove(cvo);
			total = total - cvo.getTotalPrice();
		}
		
	}
	// 카트에서 수량이 변경 되는 경우
	public static void setQuant(String idx, int su) {
		VO cvo = findProduct(idx);
		if(cvo != null) {
			total = total - cvo.getTotalPrice();
			cvo.setQuant(su);
			
			total = total + cvo.getTotalPrice();
		}
	}
}





