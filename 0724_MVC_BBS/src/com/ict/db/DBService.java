package com.ict.db;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {
	// MyBatis를 사용하기 위해서 SqlSession클래스가 필요하고 
	// SqlSessionFactory클래스 가지고 SqlSession를 만든다.
	static private SqlSessionFactory factory;
	
	// static 초기화
	static {
		try {
			factory = new SqlSessionFactoryBuilder().build(
					Resources.getResourceAsReader("com/ict/db/config.xml"));
		} catch (Exception e) {
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory ;
	}
}













