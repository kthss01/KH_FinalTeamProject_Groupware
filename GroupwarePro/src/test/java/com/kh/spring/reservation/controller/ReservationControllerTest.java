package com.kh.spring.reservation.controller;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.spring.calendar.controller.CalendarControllerTest;
import com.kh.spring.example.ControllerExampleTest.ContextConfig;
import com.kh.spring.reservation.model.dao.ReservationDao;
import com.kh.spring.reservation.model.service.ReservationService;
import com.kh.spring.reservation.model.service.ReservationServiceImpl;
import com.kh.spring.reservation.model.vo.Asset;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = { ReservationServiceImpl.class, ReservationDao.class, ContextConfig.class })
class ReservationControllerTest {

	private static final Logger logger = LoggerFactory.getLogger(CalendarControllerTest.class);

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
	ReservationService service;
	
	/*
	 ****************************************************
	 * 조회 (Read)
	 */

	@Test
	public void 자산_자산목록과함께조회() {
		ArrayList<Asset> list = service.selectAsWithCatList();
		
		logger.debug(list.toString());
	}
	
	/*
	 ****************************************************
	 * 등록 (Create)
	 */

	/*
	 ****************************************************
	 * 삭제 (Delete)
	 */

	/*
	 ****************************************************
	 * 수정 (Update)
	 */

}
