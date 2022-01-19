package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

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

		/* System.out.println(slist.get(0).getKeyword()); */
		return "index";
	}



	@ResponseBody
	@RequestMapping(value ="deleteAll", produces="text/html; charset=utf8")
	public String deleteAll() throws Exception{

		int result =dao.deleteAll();
		return String.valueOf(result);

	}


	@ResponseBody
	@RequestMapping(value ="listing", produces="text/html; charset=utf8")
	public String listing() throws Exception{

		List<SearchKeywordDTO> slist = dao.selectAll();

		Gson gson = new Gson();

		String listJson = gson.toJson(slist, List.class).toString();

		/* System.out.println(listJson); */
		return listJson;



	}

	@ResponseBody
	@RequestMapping(value ="deleteByKeyword", produces="text/html; charset=utf8")
	public String deleteByKeyword(String keyword) throws Exception{

		int result = dao.deleteByKeyword(keyword);


		return String.valueOf(result);


	}
}
