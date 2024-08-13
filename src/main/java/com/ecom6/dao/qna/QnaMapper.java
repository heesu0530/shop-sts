package com.ecom6.dao.qna;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecom6.vo.qna.QnaVo;



@Mapper
public interface QnaMapper {

	int getTotalQna();

	List<QnaVo> getQnas(QnaVo qvo);

	int qnaProc(QnaVo qvo);

	QnaVo getqnas(QnaVo qvo);

	int updateQna(QnaVo qvo);

	int deleteQna(QnaVo qvo);

	


	

	

}
