package com.ecom6.service.qna;

import java.util.Map;

import com.ecom6.common.vo.PageVo;
import com.ecom6.vo.qna.QnaVo;



public interface QnaService {

	Map<String, Object> getQnaLists(QnaVo qvo, PageVo pgvo);

	int qnaProc(QnaVo qvo);

	QnaVo getqnas(QnaVo qvo);

	int updateQna(QnaVo qvo);

	int deleteQna(QnaVo qvo);




	

	




	

}
