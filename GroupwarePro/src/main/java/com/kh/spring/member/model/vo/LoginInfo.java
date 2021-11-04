package com.kh.spring.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

public class LoginInfo {
		private String empNo;
		private String loginId;
		private String loginPwd;
		private String status;
}
