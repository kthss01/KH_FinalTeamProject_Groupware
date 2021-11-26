package com.kh.spring.reservation.model.service;

import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.Date;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.example.ControllerExampleTest.ContextConfig;
import com.kh.spring.reservation.model.dao.ReservationDao;
import com.kh.spring.reservation.model.vo.Asset;
import com.kh.spring.reservation.model.vo.AssetCategory;
import com.kh.spring.reservation.model.vo.Reservation;

/*
 * Reservation Service에 있는 Dao 테스트
 */

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = { ReservationDao.class, ContextConfig.class })
public class ReservationServiceTest {

	private static final Logger logger = LoggerFactory.getLogger(ReservationServiceTest.class);

	// Session DI 하기 위한 Configuration 클래스위에 annotation 형태가 아니고 xml로 되어있어서 따로 추가
	@Configuration
	@ImportResource(locations = { "file:src/main/resources/root-context.xml" })
	public static class ContextConfig {

		@Inject
		private SqlSessionFactory sqlFactory;

		@Bean
		public SqlSession sqlSession() {
			return sqlFactory.openSession();
		}

	}

	@Autowired
	SqlSessionTemplate sqlSession;

	@Autowired
	ReservationDao dao;
	
	/*
	 ****************************************************
	 * 조회 (Read)
	 */
	@Test
	public void 예약_조회() {
		// given
		
		// when
		ArrayList<Reservation> list = dao.selectRezList(sqlSession);
		
		// then
		logger.debug(list.toString());
		assertEquals("조회된 예약 수는 4개여야한다.", 4, list.size());
	}

	@Test
	public void 자산_조회() {
		// given
		
		// when
		ArrayList<Asset> list = dao.selectAsList(sqlSession);
		
		// then
		logger.debug(list.toString());
		assertEquals("조회된 자산 수는 7개여야한다.", 7, list.size());
	}
	
	@Test
	public void 자산목록_조회() {
		// given
		
		// when
		ArrayList<AssetCategory> list = dao.selectAsCatList(sqlSession);
		
		// then
		logger.debug(list.toString());
		assertEquals("조회된 자산 목록 수는 3개여야한다.", 3, list.size());
	}
	
	@Test
	/*
	 * 자산과 자산목록 함께 조회
	 */
	public void 자산_자산목록_조회() {
		// given
		
		// when
		ArrayList<Asset> list = dao.selectAsWithCatList(sqlSession);
		
		// then
		logger.debug(list.toString());
		assertEquals("조회된 자산 수는 7개여야한다.", 7, list.size());
		
		for (Asset asset : list) {
			logger.debug(asset.getCategory().toString());
		}
	}
	
	@Test
	/*
	 * 특정 자산 목록에 맞는 예약 조회
	 */
	public void 특정자산목록_예약_조회() {
		// given
		int ascNo = 1;
		
		// when
		ArrayList<Reservation> list = dao.selectRezListForCat(sqlSession, ascNo);
		
		// then
		logger.debug(list.toString());
		assertEquals("조회된 예약 수는 2개여야한다.", 2, list.size());
	}
	
	@Test
	/*
	 * 특정 자산 목록에 맞는 자산 조회
	 */
	public void 특정자산목록_자산_조회() {
		// given
		int ascNo = 1;
		
		// when
		ArrayList<Asset> list = dao.selectAsListForCat(sqlSession, ascNo);
		
		// then
		logger.debug(list.toString());
		assertEquals("조회된 자산 수는 2개여야한다.", 2, list.size());
	}
	
	/*
	 ****************************************************
	 * 등록 (Create)
	 */
	
	@Test
	@Transactional
	public void 예약_등록() {
		// given
		int asNo = 1;
		int empNo = 201;
		Reservation rez = new Reservation();
		rez.setAsNo(asNo);
		rez.setName("예약 테스트");
		rez.setStartDate(new Date());
		rez.setEndDate(new Date());
		rez.setEmpNo(empNo);
		rez.setAllDay("0");
		
		// when
		dao.insertReservation(sqlSession, rez);
		
		// then
		ArrayList<Reservation> list = dao.selectRezList(sqlSession);
		for (Reservation reservation : list) {
			if (reservation.getName().equals(rez.getName())) {
				logger.debug(reservation.toString());
				assertEquals("등록된 예약과 시작일이 같아야 한다.", reservation.getStartDate().toString(), rez.getStartDate().toString());
				assertEquals("등록된 예약과 종료일이 같아야 한다.", reservation.getEndDate().toString(), rez.getEndDate().toString());
				assertEquals("사원 번호가 같아야 한다.", reservation.getEmpNo(), rez.getEmpNo());
				assertEquals("자산 번호가 같아야 한다.", reservation.getAsNo(), rez.getAsNo());
				return;
			}
		}
		
		fail("등록된 예약을 찾을 수 없음");
	}
	
	@Test
	@Transactional
	public void 자산_등록() {
		// given
		int ascNo = 1;
		Asset as = new Asset();
		as.setAscNo(ascNo);
		as.setName("자산 테스트");
		as.setColor("green");
		
		// when
		dao.insertAsset(sqlSession, as);
		
		// then
		ArrayList<Asset> list = dao.selectAsList(sqlSession);
		for (Asset asset : list) {
			if (asset.getName().equals(as.getName())) {
				logger.debug(asset.toString());
				assertEquals("자산목록 번호가 같아야한다.", asset.getAscNo(), as.getAscNo());
				assertEquals("색깔이 같아야한다.", asset.getColor(), as.getColor());
				return;
			}
		}
		
		fail("등록된 자산을 찾을 수 없음");
	}
	
	@Test
	@Transactional
	public void 자산목록_등록() {
		// given
		AssetCategory asc = new AssetCategory();
		asc.setName("자산목록 테스트");
		
		// when
		dao.insertAssetCategory(sqlSession, asc);
		
		// then
		ArrayList<AssetCategory> list = dao.selectAsCatList(sqlSession);
		for (AssetCategory assetCategory : list) {
			if (assetCategory.getName().equals(asc.getName())) {
				logger.debug(assetCategory.toString());
				return;
			}
		}
		
		fail("등록된 자산목록 찾을 수 없음");
	}

	/*
	 ****************************************************
	 * 삭제 (Delete)
	 */
	
	@Test
	@Transactional
	public void 예약_삭제() {
		// given 
		int rezNo = 1;
		
		// when
		dao.deleteReservation(sqlSession, rezNo);
		
		// then
		ArrayList<Reservation> list = dao.selectRezList(sqlSession);
		for (Reservation reservation : list) {
			if (reservation.getRezNo() == rezNo) {
				fail("삭제된 예약이 조회됨");
			}
		}
	}
	
	@Test
	@Transactional
	public void 자산_삭제() {
		// given
		int asNo = 1;
		
		// when
		dao.deleteAsset(sqlSession, asNo);
		
		// then
		ArrayList<Asset> list = dao.selectAsList(sqlSession);
		for (Asset asset : list) {
			if (asset.getAsNo() == asNo) {
				fail("삭제된 자산이 발견됨");
			}
		}
	}
	
	@Test
	@Transactional
	public void 자산목록_삭제() {
		// given 
		int ascNo = 1;
		
		// when
		dao.deleteAssetCategory(sqlSession, ascNo);
		
		// then
		ArrayList<AssetCategory> list = dao.selectAsCatList(sqlSession);
		for (AssetCategory assetCategory : list) {
			if (assetCategory.getAscNo() == ascNo) {
				fail("삭제된 자산목록이 발견됨");
			}
		}
	}
	
	
	/*
	 ****************************************************
	 * 수정 (Update)
	 */
	
	@Test
	@Transactional
	public void 예약_수정() {
		// given
		int rezNo = 1;
		Reservation rez = new Reservation();
		rez.setName("수정된 예약");
		rez.setStartDate(new Date());
		rez.setEndDate(new Date());
		rez.setRezNo(rezNo);
		rez.setAsNo(2);
		
		// when
		dao.updateReservation(sqlSession, rez);
		
		// then
		ArrayList<Reservation> list = dao.selectRezList(sqlSession);
		for (Reservation reservation : list) {
			if (reservation.getRezNo() == rezNo) {
				logger.debug(reservation.toString());
				assertEquals("예약명이 같아야 한다.", reservation.getName(), rez.getName());
				assertEquals("시작일이 같아야 한다.", reservation.getStartDate().toString(), rez.getStartDate().toString());
				assertEquals("종료일이 같아야 한다.", reservation.getEndDate().toString(), reservation.getEndDate().toString());
				assertEquals("자산번호가 같아야 한다.", reservation.getAsNo(), rez.getAsNo());
				return;
			}
		}
		
		fail("수정된 예약을 찾을 수 없음");
	}
	
	@Test
	@Transactional
	public void 자산_수정() {
		// given
		int asNo = 2;
		Asset as = new Asset();
		as.setName("수정된 자산");
		as.setColor("green");
		as.setAscNo(3);
		as.setAsNo(asNo);
		
		// when
		dao.updateAsset(sqlSession, as);
		
		// then
		ArrayList<Asset> list = dao.selectAsList(sqlSession);
		for (Asset asset : list) {
			if (asset.getAsNo() == asNo) {
				assertEquals("이름이 같아야 한다.", asset.getName(), as.getName());
				assertEquals("색깔이 같아야 한다.", asset.getColor(), as.getColor());
				assertEquals("자산목록번호가 같아야 한다.", asset.getAscNo(), as.getAscNo());
				return;
			}
		}
		
		fail("수정된 자산을 찾을 수 없음");
	}
	
	@Test
	@Transactional
	public void 자산목록_수정() {
		// given
		int ascNo = 1;
		AssetCategory asc = new AssetCategory();
		asc.setName("수정된 자산목록");
		asc.setAscNo(ascNo);
		
		// when
		dao.updateAssetCategory(sqlSession, asc);
		
		// then
		ArrayList<AssetCategory> list = dao.selectAsCatList(sqlSession);
		for (AssetCategory assetCategory : list) {
			if (assetCategory.getAscNo() == ascNo) {
				assertEquals("이름이 같아야 한다.", assetCategory.getName(), asc.getName());
				return;
			}
		}
		
		fail("수정된 자산목록 찾을 수 없음");
	}
}
