package com.ezen.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.PagingVO;
import com.ezen.vo.RegularPayPostVO;
import com.ezen.vo.RegularVO;

@Repository
public class RegularDAO {
	
	@Autowired
	SqlSession sql;
	
	private static final String Namespace = "com.ezen.mapper.RegularMapper";
	
	public List<RegularVO> regularList(PagingVO vo) throws Exception {
		return sql.selectList(Namespace+".regularList",vo);
	}
	
	public int regCount() throws Exception {
		return sql.selectOne(Namespace+".regCount");
	}
	
	public RegularVO regDetail(int regIdx) throws Exception{
		return sql.selectOne(Namespace+".regDetail", regIdx);
	}
	
	public void addRegular(RegularPayPostVO vo) throws Exception {
		sql.insert(Namespace+".addRegular", vo);
	}
	
	public void autoAddRegular(RegularPayPostVO vo) throws Exception {
		sql.insert(Namespace+".autoAddRegular", vo);
	}
	
	public List<RegularPayPostVO> autoSelect(String day) throws Exception {
		return sql.selectList(Namespace+".autoSelect", day);
	}
	
	public List<RegularPayPostVO> regularOrderList(int midx) throws Exception {
		return sql.selectList(Namespace+".regularOrderList", midx);
	}
}
