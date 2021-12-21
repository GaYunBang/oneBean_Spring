package com.ezen.service;

import java.util.List;

import com.ezen.vo.*;

public interface RegularService {
	
	public List<RegularVO> regularList(PagingVO vo) throws Exception;
	
	public void addRegular(RegularPayPostVO vo) throws Exception;
	
	public List<RegularPayPostVO> autoSelect(String today) throws Exception;
	
	//����¡�� ���� ��ǰ ���� ����
	public int regCount() throws Exception;
	
	public RegularVO regDetail(int regIdx) throws Exception;
}
