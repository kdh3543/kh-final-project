package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BoardDTO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 전체 게시글 리스트
	public List<BoardDTO> selectAll() {
		return mybatis.selectList("Board.selectAll");
	}
	
	// 시퀀스로 검색
	public BoardDTO selectBySeq(int seq) {
		return mybatis.selectOne("Board.selectBySeq", seq);
	}
	
	// 신규 게시글 삽입
	public int insert(BoardDTO dto) {
		mybatis.insert("Board.insert", dto);
		return dto.getBoard_seq();
	}
	
	// 시퀀스로 삭제
	public int delete(int seq) {
		return mybatis.delete("Board.delete", seq);
	}
	
	// 게시글 수정
	public int modify(BoardDTO dto) {
		return mybatis.update("Board.modify", dto);
	}
}
