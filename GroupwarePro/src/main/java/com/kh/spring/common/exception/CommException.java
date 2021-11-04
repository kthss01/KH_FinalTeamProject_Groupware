package com.kh.spring.common.exception;

public class CommException extends RuntimeException {
	public CommException() {}
	public CommException(String msg) {
		super(msg);
	}
}
