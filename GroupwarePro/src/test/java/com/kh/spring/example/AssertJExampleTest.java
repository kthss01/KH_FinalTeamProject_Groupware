package com.kh.spring.example;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.catchThrowable;
import static org.assertj.core.api.Assertions.offset;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/*
 * AssertJ 예제 
 * junit에서 함께 사용되는 라이브러리
 * 문법이 junit보다 더 풍부하고 좀더 직관적으로 테스트 흐름 작성 가능하다고 함
 * junit 사용시 필수로 사용하는 추세
 */

public class AssertJExampleTest {

	@Test
	// 아예 메서드를 보기 쉽게 한글로 쓰기도 한다고 함 (우아한 형제)
	// @DisplayName 안쓰면 그냥 함수 이름으로 테스트명 적힘 
	void 문자열테스트() {
		// import할 때 assertions 있는거 해야함
		// 주어진 문자열 테ㅡ트
		assertThat("Hello, world! Nice to meet you.")
			.isNotEmpty() // 비어잇지 않고
			.contains("Nice") // "Nice"를 포함하고
			.contains("world") // "world"도 포함하고
			.doesNotContain("ZZZ") // "ZZZ"는 포함하지 않으며
			.startsWith("Hell") // "Hell"로 시작하고
			.endsWith("u.") // "u."로 끝나며
			.isEqualTo("Hello, world! Nice to meet you."); // 이 문자열과 같다
	}
	
	@Test
	@DisplayName("숫자 테스트")
	void 숫자테스트() {
		assertThat(3.14d) // 주어진 3.14라는 숫자는
			.isPositive() // 양수이고
			.isGreaterThan(3) // 3보다 크며
			.isLessThan(4) // 4보다 작으며
			.isEqualTo(3, offset(1d)) // 오프셋 1 기준 3과 같고
			.isEqualTo(3.1, offset(0.1d)) // 오프셋 0.1 기준 3.1과 같고
			.isEqualTo(3.14); // 오프셋 없이 3.14와 같음
	}
	
	// BDD 스타일
	// given, when, then으로 이루어진 스타일
	@Test
	public void BDD스타일예외발생테스트() {
		// given
		// 조건이 주어짐
		boolean b = true;
		Throwable thrown = null;
		
		// when
		// 특정 상황 때
		if (b == true) {
			thrown = catchThrowable(() -> { 
				throw new Exception("예외발생");
			});
		}
		
		// then
		// 이렇게 된다
		assertThat(thrown).isInstanceOf(Exception.class)
			.hasMessageContaining("예외발생");
	}
}
