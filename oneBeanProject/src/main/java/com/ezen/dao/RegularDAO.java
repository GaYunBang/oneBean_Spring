package com.ezen.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.RegularVO;

@Repository
public class RegularDAO {
	
	@Autowired
	SqlSession sql;
	
	private static final String Namespace = "com.ezen.mapper.RegularMapper";
	
	public List<RegularVO> regularList(){
		return sql.selectList(Namespace+".regularList");
	}
}
