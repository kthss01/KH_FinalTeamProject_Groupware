package com.kh.spring.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggerAspect {

	private static final Logger logger = LoggerFactory.getLogger(LoggerAspect.class);
	
	public Object loggerAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		
		Signature sig = joinPoint.getSignature();
		String type = sig.getDeclaringTypeName();
		String methodName = sig.getName();
		
		String cName = "";
		if (type.indexOf("Controller") > -1) {
			cName = "Controller : ";
		} else if (type.indexOf("Sevice") > -1) {
			cName = "Service : ";
		} else if (type.indexOf("Dao") > -1) {
			cName = "Dao : ";
		}
		
		logger.info("[Before] " + cName + type + "." + methodName + "()");
		Object obj = joinPoint.proceed();
		logger.info("[After] " + cName + type + "." + methodName + "()");
		
		return obj;
	}
	
}
