package com.ecom6.service.qna;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVo;
import com.ecom6.dao.qna.QnaMapper;
import com.ecom6.vo.qna.QnaVo;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	QnaMapper qnaDao;

  @Override
  public Map<String, Object> getQnaLists(QnaVo qvo, PageVo pgvo) {
      Map<String, Object> reSet = new HashMap<>();
      // 전체 문의글 개수
      int qnaTot = qnaDao.getTotalQna();
      reSet.put("qanTot", qnaTot);
      
      // 페이지 계산
      if (pgvo.getCurBl() <= 0) pgvo.setCurBl(1);
      if (pgvo.getCurPg() <= 0) pgvo.setCurPg(1);

      int start = (pgvo.getCurPg() - 1) * PageInfo.ROW_OF_PAGE + 1;
      int end = (pgvo.getCurPg() * PageInfo.ROW_OF_PAGE) > qnaTot ?
              qnaTot : pgvo.getCurPg() * PageInfo.ROW_OF_PAGE;
      qvo.setStart(start);
      qvo.setEnd(end);

      // 페이지 수 계산
      int pgCnt = (qnaTot % PageInfo.ROW_OF_PAGE == 0) ?
              qnaTot / PageInfo.ROW_OF_PAGE :
              qnaTot / PageInfo.ROW_OF_PAGE + 1;
      pgvo.setPgCnt(pgCnt);

      // 페이지 블록 계산
      int blockCnt = (pgCnt % PageInfo.PAGE_OF_BLOCK == 0) ?
              pgCnt / PageInfo.PAGE_OF_BLOCK :
              pgCnt / PageInfo.PAGE_OF_BLOCK + 1;
      pgvo.setBlockCnt(blockCnt);
      
      // startPg
      int startPg = (pgvo.getCurBl() - 1) * PageInfo.PAGE_OF_BLOCK + 1;
      pgvo.setStartPg(startPg);
      
      // endPg
      int endPg = pgvo.getCurBl() * PageInfo.PAGE_OF_BLOCK > pgCnt ?
              pgCnt : pgvo.getCurBl() * PageInfo.PAGE_OF_BLOCK;
      pgvo.setEndPg(endPg);
      
      // qnaList
      List<QnaVo> getQnaList = qnaDao.getQnas(qvo);
      reSet.put("qnaList", getQnaList);
      reSet.put("pgvo", pgvo);
      
      return reSet;
  }

	@Override
	public int qnaProc(QnaVo qvo) {
		return qnaDao.qnaProc(qvo);
	}

	@Override
	public QnaVo getqnas(QnaVo qvo) {
		return qnaDao.getqnas(qvo);
	}

	@Override
	public int updateQna(QnaVo qvo) {
		return qnaDao.updateQna(qvo);
	}

	@Override
	public int deleteQna(QnaVo qvo) {
		return qnaDao.deleteQna(qvo);
	}




	

	

}
