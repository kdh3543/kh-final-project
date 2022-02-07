package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.SafeDealDTO;

@Repository
public class SafeDealDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Autowired
	HttpSession session;


	public int insert(SafeDealDTO dto) {
		return mybatis.insert("SafeDeal.insert",dto);
	}


	public int dealOk(SafeDealDTO sddto) {
		System.out.println("dealOk 다오에 도착함"+sddto.getCash()+":"+sddto.getSeller());
//		int cash = sddto.getCash();
//		String seller =sddto.getSeller();
//		Map<String,Integer> param = new HashMap<String,Integer>();
//		param.put("cash",cash);
//		Map<String,String> map = new HashMap<String,String>();
//		param.put("cash",cash);
	
		return mybatis.update("SafeDeal.dealOk",sddto);
		
	}


	public SafeDealDTO selectAllDealOkBySeq(int iseq) {
		
		return mybatis.selectOne("SafeDeal.selectAllDealOkBySeq",iseq);
	}


	public int dealCancel(SafeDealDTO sddto) {
		
		
		return mybatis.update("SafeDeal.dealCancel",sddto);

	}
	
	public boolean selectCount(SafeDealDTO sddto) {
		return mybatis.selectOne("SafeDeal.selectCount",sddto);
	}

}
