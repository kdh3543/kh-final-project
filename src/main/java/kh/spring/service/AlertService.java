package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.AlertDAO;

@Service
public class AlertService {
	
	@Autowired
	public AlertDAO adao;

	public int selectCount(String id) {
		return adao.selectCount(id);
	}
	
}
