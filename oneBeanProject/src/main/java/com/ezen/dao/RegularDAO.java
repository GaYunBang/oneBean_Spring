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
	
	public void autoAddDelivery(RegularPayPostVO vo) throws Exception {
		sql.insert(Namespace+".autoAddDelivery", vo);
	}
	
	public List<RegularPayPostVO> autoSelect(String today) throws Exception {
		return sql.selectList(Namespace+".autoSelect", today);
	}
}
