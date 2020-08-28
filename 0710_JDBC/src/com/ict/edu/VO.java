package com.ict.edu;

// 파라미터와 DB정보를 저장하는 객체를 VO라고 한다.
public class VO {
	// DB 컬럼과 파라미터이름과 같은 변수명을 사용하여야 편한다.
	private String idx, m_id, m_pw, m_name, m_age, m_reg;
	public VO() {}
	public VO(String idx, String m_id, String m_pw, String m_name, String m_age, String m_reg) {
		super();
		this.idx = idx;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_age = m_age;
		this.m_reg = m_reg;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_age() {
		return m_age;
	}
	public void setM_age(String m_age) {
		this.m_age = m_age;
	}
	public String getM_reg() {
		return m_reg;
	}
	public void setM_reg(String m_reg) {
		this.m_reg = m_reg;
	}
	
}