package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.FilesDAO;
import kh.spring.dao.ItemsDAO;
import kh.spring.dto.BestBuyerDTO;
import kh.spring.dto.BestSellerDTO;
import kh.spring.dto.CommentDTO;
import kh.spring.dto.CountUploadItemsDTO;
import kh.spring.dto.ItemGraphDTO;
import kh.spring.dto.ItemsDTO;
import kh.spring.dto.ItemsQNADTO;
import kh.spring.dto.ItemsReportCountDTO;
import kh.spring.dto.ItemsReportDTO;
import kh.spring.dto.PriceRangeDTO;
import kh.spring.utils.DateParseUtils;

@Service
public class ItemsService {

	@Autowired
	public ItemsDAO idao;

	@Autowired
	public FilesDAO fdao;

	public int insert(ItemsDTO dto) {

		return idao.insert(dto);

	}

	public List<ItemsDTO> selectAll() {

		return idao.selectAll();
	}

	public List<ItemsDTO> selectBySeq(int iseq) {
		return idao.selectBySeq(iseq);

	}

	public List<ItemsDTO> selectByName(List<String> targetList, int iseq) {

		return idao.selectByName(targetList, iseq);
	}

	public List<ItemsDTO> selectNameToSeq(List<ItemsDTO> rilist) {

		return idao.selectNameToSeq(rilist);
	}


	//상품 판매내역
	public List<ItemsDTO> selectMineById(String id) {

		return idao.selectMineById(id);
	}

	public int sellCount(String id) {

		return idao.sellCount(id);
	}

	//상품 구매내역

	public List<ItemsDTO> buyIList(String id) {

		return idao.buyIList(id);
	}

	public int buyCount(String id) {
		return idao.buyCount(id);


	}







	public int updateProc(String deal, int iseq) {

		return idao.updateProc(deal, iseq);
	}

	public int itemsModifyProc(ItemsDTO dto) {
		return idao.itemsModifyProc(dto);
	}


	public int itemsDeleteBySeq(int iseq) {

		return idao.itemsDeleteBySeq(iseq);

	}



	public List<ItemsDTO> selectById(String id) {
		return idao.selectById(id);
	}


	// 채팅에서 상품아이디 통해서 판매자 아이디 가져오기
	public String selectByProductId(int productId) {
		return idao.selectByProductId(productId);
	}

	public int addViewCount(int iseq) {
		return idao.addViewCount(iseq);
	}

	public List<ItemsDTO> selectByCategory(String category) {

		return idao.selectByCategory(category);
	}

	public List<ItemsDTO> selectByIName(String name) {
		return idao.selectByIName(name);
	}


	public List<ItemsDTO> sellCountAll() {
		return idao.sellCountAll();
	}



	// 신규 상품 문의 삽입
	public int insertQNA(ItemsQNADTO dto) {
		return idao.insertQNA(dto);
	}

	// 시퀀스로 상품 문의 삭제
	public int deleteQNA(int seq) {
		return idao.deleteQNA(seq);
	}

	public int ItemsCount(int iseq) {
		return idao.ItemsCount(iseq);
	}

	public List<ItemsDTO> selectByIseq(int iseq) {
		return idao.selectByIseq(iseq);

	}




	// 시퀀스로 상품 문의 검색
	public List<ItemsQNADTO> selectQNABySeq(int seq) {
		List<ItemsQNADTO> list = idao.selectQNABySeq(seq);
		for (ItemsQNADTO dto : list) {
			dto.setParsed_date(DateParseUtils.parseDate(dto.getWrite_date()));
		}
		return list;
	}
	
	// 관리자
	 public List<CountUploadItemsDTO> countUploadItems() {
	      return idao.countUploadItems();
	   }

	   public int countSell() {
	      return idao.countSell();   
	   }

	   public int countBuy() {
	      return idao.countBuy();   
	   }

	   public List<BestSellerDTO> bestSeller() {
	      return idao.bestSeller();   
	   }

	   public List<BestBuyerDTO> bestBuyer() {
	      return idao.bestBuyer();   
	   }

	   public List<PriceRangeDTO> ItemsPriceRange() {
	      return idao.ItemsPriceRange();   
	      
	   }

	   public List<ItemsReportDTO> ItemsReport() {
	      return idao.ItemsReport();   
	      
	   }

	   public  List<ItemsReportCountDTO> ItemsReportCount() {
	      return idao.ItemsReportCount();   

	   }





}