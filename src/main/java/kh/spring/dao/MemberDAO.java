package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
   @Autowired
   private SqlSessionTemplate mybatis;

   //member테이블에 회원가입시 입력한 값 저장
   public int insert(MemberDTO dto) {
      return mybatis.insert("Member.insert",dto);
   }
   //id 중복 체크 기능

   public int idCheck(String id) {
      return mybatis.selectOne("Member.idCheck",id);
   }
   //로그인 기능
   public int login(String logid, String logpw) {

      Map<String,String> map = new HashMap<>();
      map.put("id", logid);
      map.put("pw", logpw);   

      return mybatis.selectOne("Member.login",map);
   }
   //id로 마이페이지 들어가기
   public MemberDTO select(String id) {
      return mybatis.selectOne("Member.mypage",id);
   }
   //이미 가입한 카카오 계정
   public MemberDTO selectBykakaoemail(String kakaoemail) {
      return mybatis.selectOne("Member.selectBykakaoemail",kakaoemail);
   }
   //회원정보 변경
   public int modify(MemberDTO dto) {
      return mybatis.update("Member.modify",dto);
   }
   //회원 탈퇴
   public int delete(String id) {
      return mybatis.delete("Member.delete",id);
   }
   //가입 후 날짜
   public int signDate(String id) {
      return mybatis.selectOne("Member.signDate",id);
   }
   //kakao 회원 여부확인
   public int selectBykakao(String kakaoemail) {
      return mybatis.selectOne("Member.selectBykakao",kakaoemail);
   }
   //kakao 회원 가입 정보 입력
   public int kakaoinsert(MemberDTO dto) {
      return mybatis.insert("Member.kakaoinsert",dto);
   }
   //id찾기
   public MemberDTO selectID(String email,String phone) {
      Map<String,String> map = new HashMap<>();
      map.put("email", email);
      map.put("phone", phone);
      return mybatis.selectOne("Member.selectID",map);
   }
   //아이디 존재여부확인
   public int selectIDexist(String email,String phone) {
      Map<String,String> map = new HashMap<>();
      map.put("email", email);
      map.put("phone", phone);
      return mybatis.selectOne("Member.selectIDexist",map);
   }
   //계정 존재 여부 확인
   public int AccountExist(String inputID,String inputEmail) {
      System.out.println(inputID+"dao");
      System.out.println(inputEmail+"dao");
      Map<String,String> map = new HashMap<>();
      map.put("inputID", inputID);
      map.put("inputEmail", inputEmail);
      return mybatis.selectOne("Member.AccountExist",map);
   }
   //비밀번호 변경
   public int updatePw(String pw,String id) {
      Map<String,String> map = new HashMap<>();
      System.out.println("암호화된 pw>?"+pw);
      map.put("pw", pw);
      map.put("id",id);
      return mybatis.update("Member.updatePw",map);
   }

}