package com.ecom6.vo.qna;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class QnaVo {
	private int start; // 페이지 시작 레코드(투플)
	private int end; // 페이지 끝레코드(튜플)
	private int rn;
	private int nbno;
	
	private int bno;
	private int bref;
	private int bstep;
	private int blevel;
	private int readcount;
	private String subject;
	private String content;
	private String writer;
	private String regdate;
	private String ip;
	private String passwd;
	private String adminPasswd;
	
	private String items;
	private String text;
}

