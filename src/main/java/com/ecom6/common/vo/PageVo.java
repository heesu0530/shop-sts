package com.ecom6.common.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PageVo {
	 private int pgCnt; //총페이지수
	 private int blockCnt; //총 페이지 블록 수
	 private int curPg =1; //현재 페이지
	 private int curBl=1;  //현재 블럭
	 private int startPg=1; //현재 블록의 시작 페이지
	 private int endPg=1;    //현재 블록 끝페이지
}
