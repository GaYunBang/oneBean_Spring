package com.ezen.utils;

import java.text.DecimalFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ezen.dao.RegularDAO;
import com.ezen.vo.RegularPayPostVO;

@Component
public class Scheduler {
	
	@Autowired
	RegularDAO regularDAO;
	
	@Scheduled(cron = "0 0 10 *  * *")
	public void test() throws Exception {
		
		//오늘날짜에 해당하는 날짜포맷
		Calendar cal = Calendar.getInstance();
		String today = cal.get(Calendar.YEAR)+"-"+new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1)+ "-"+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		List<RegularPayPostVO> list = regularDAO.autoSelect(today);
		System.out.println("tt"+today);
		for(RegularPayPostVO vo:list) {
			Random rand = new Random();
			
			vo.setRegComPostNum(rand.nextInt(888888) + 111111);
			regularDAO.autoAddDelivery(vo);
		}
	}
}
