package com.kh.spring.example;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/*
 * JUnit5 예제
 * 순수 JUnit5만 사용 - 참고
 * 
 * 각 테스트 메서드는 서로 독립적이어야 함
 */

// 테스트 클래스 이름 뒤에 보통 Test를 붙임
//@Disabled("테스트 클래스 자체도 비활성화 가능")
public class JUnitExampleTest {

	// 어노테이션 @Test 붙임 됨
	// 이때 private 이면 안됨
	@Test
	@Disabled("테스트 비활성화 어노테이션")
	void sum() {
		int result = 2 + 3;
		assertEquals(5, result);
	}
	
	// LifeCycleTest
	public JUnitExampleTest() {
		System.out.println("생성자 호출");
	}
	
	@BeforeEach
	void setUp() {
		System.out.println("테스트 실행 전 호출");
	}
	
	@Test
	@DisplayName("테스트 A")
	void testA() {
		System.out.println("테스트 A");
	}
	
	@Test
	void testB() {
		System.out.println("테스트 B");
	}
	
	@Test
	void testC() {
		System.out.println("테스트 C Fail 예정");
//		int result = 3;
//		assertEquals(5, result);
	}
	
	void tearDown() {
		System.out.println("테스트 실행 후 호출");
	}
}
