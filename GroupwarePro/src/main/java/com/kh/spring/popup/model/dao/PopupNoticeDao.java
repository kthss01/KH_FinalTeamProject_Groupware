package com.kh.spring.popup.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.popup.model.vo.PopupNotice;

@Repository
public class PopupNoticeDao {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<PopupNotice> selectPNoticeList(SqlSessionTemplate session) {
		return (ArrayList)session.selectList("pNoticeMapper.selectpNoticeList");
	}
	public int insertPNotice(SqlSessionTemplate session, PopupNotice p) {
		return session.insert("pNoticeMapper.insertpNotice",p);
	}
	public int deletePNotice(SqlSessionTemplate session, String popNo) {
		return session.delete("pNoticeMapper.deletepNotice",popNo);
	}
	public int updatePNotice(SqlSessionTemplate session, PopupNotice popupNotice) {
		return session.update("pNoticeMapper.updatepNotice", popupNotice);
	}
	public PopupNotice selectPNotice(SqlSessionTemplate session,String popNo) {
		return session.selectOne("pNoticeMapper.selectpNotice",popNo);
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<PopupNotice> selectPNoticeNewList(SqlSessionTemplate session) {
		return (ArrayList)session.selectList("pNoticeMapper.selectNewpNoticeList");
	}
	

	

}
