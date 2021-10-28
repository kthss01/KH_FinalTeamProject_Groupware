package com.kh.spring.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.kh.spring.member.model.vo.Member;

@Aspect
@Component
public class AfterReturningAspect {

	private static final Logger logger = LoggerFactory.getLogger(AfterReturningAspect.class);
	
	@AfterReturning(pointcut="execution(* com.kh.spring..*ServiceImpl.login*(..))", returning="returnObj")
	public void loggerAdvice(JoinPoint joinpoint, Object returnObj) {
		
		if (returnObj instanceof Member) {
			Member m = (Member) returnObj;
			
			if (m.getUserId().equals("admin")) {
				logger.info("[LOG] : 관리자님 환영합니다");
			} else {
				logger.info("[LOG] : " + m.getUserName() +" 로그인 성공!!");
			}
		}
		
	}
}
