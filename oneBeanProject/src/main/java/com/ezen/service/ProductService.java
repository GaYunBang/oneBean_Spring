package com.ezen.service;

import java.util.List;

import com.ezen.vo.*;

public interface ProductService {

	//��ǰ ����Ʈ �ҷ�����
	public List<ProductVO> proListAll(PagingVO vo) throws Exception;
	
	public List<ProductVO> coffeeProList(PagingVO vo) throws Exception;
	
	public List<ProductVO> buisnessProList(PagingVO vo) throws Exception;
	
	public List<ProductVO> sampleBoxList(PagingVO vo) throws Exception;
	
	//��ǰ �󼼺���
	public ProductVO proDetail(int proIdx) throws Exception;
	
	//����ǰ ������
	public ProductVO newPro() throws Exception;
	
	//����¡�� ���� ��ǰ ���� ����
	public int proListAllCount() throws Exception;
	
	public int coffeeProListCount() throws Exception;
	
	public int buisnessProListCount() throws Exception;
	
	public int sampleBoxListCount() throws Exception; 
}
