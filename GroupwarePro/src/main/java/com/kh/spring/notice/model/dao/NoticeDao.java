package com.kh.spring.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.notice.model.vo.CompanyNotice;

@Repository
public class NoticeDao {

	

	

	public static int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

	public static ArrayList<CompanyNotice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList",null,rowBounds);
	}

	public static int insertNotice(SqlSessionTemplate sqlSession, CompanyNotice notice) {
		// TODO Auto-generated method stub
		return sqlSession.insert("noticeMapper.insertNotice",notice);
	}

}
