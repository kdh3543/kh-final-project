package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.SearchKeywordDAO;
import kh.spring.dto.SearchKeywordDTO;

@Controller
@RequestMapping("/search/")	
public class SearchController {
	
	@Autowired
	public SearchKeywordDAO dao;
	
	@RequestMapping("searchByInput")	
	public String input(SearchKeywordDTO dto,Model model) {
		
		  //검색 목록에 값 저장
		
		dao.insert(dto);
		
		// 최근검색어 목록 10개 보여줌
		
		List <SearchKeywordDTO> slist = dao.selectAll();
		model.addAttribute("slist",slist);
		
		System.out.println(slist.get(0).getKeyword());
		return "/index";
	}
	

	
}
