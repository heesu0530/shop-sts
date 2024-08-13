package com.ecom6.vo.mem;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.web.context.WebApplicationContext;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Scope(value = WebApplicationContext.SCOPE_SESSION,
proxyMode = ScopedProxyMode.TARGET_CLASS)

public class MemberVo {

		private int rn;
		private String mem_id;
		private String mem_passwd;
		private String gender_ab;
		private String mem_name;
		private String mem_birth;
		private String mem_phone;
		private String mem_email;
		private String zipcode;
		private String address;
		private String address2;
		private String reg_date;
		private String country_ab;
		private String modi_date;
		private String state_yn;
		private String ip;
		private String mem_role;
		private int start;
		private int end;
		}

