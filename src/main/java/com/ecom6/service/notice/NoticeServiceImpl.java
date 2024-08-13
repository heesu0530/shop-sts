package com.ecom6.service.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVo;
import com.ecom6.dao.notice.NoticeMapper;
import com.ecom6.vo.notice.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
     @Autowired
     NoticeMapper noticeDao;
	
	@Override
	public Map<String, Object> getNoticies(NoticeVo nvo, PageVo pgvo) {
		Map<String, Object> reSet = new HashMap<>();
		//전체 공지사항 개수
		int noticeTot = noticeDao.getTotalNotice();
		//page 계산
		if(pgvo.getCurBl()<=0) pgvo.setCurBl(1);
		if(pgvo.getCurPg()<=0) pgvo.setCurPg(1);
		
		int start = (pgvo.getCurPg()-1)*PageInfo.ROW_OF_PAGE+1;
		int end = (pgvo.getCurPg()*PageInfo.ROW_OF_PAGE)>noticeTot?
				   noticeTot : pgvo.getCurPg()*PageInfo.ROW_OF_PAGE;
		nvo.setStart(start);
		nvo.setEnd(end);
		
		//페이지 수 계산
		int pgCnt = (noticeTot%PageInfo.ROW_OF_PAGE==0)?
				    noticeTot/PageInfo.ROW_OF_PAGE:
				    noticeTot/PageInfo.ROW_OF_PAGE+1;
		pgvo.setPgCnt(pgCnt);
		//페이지 블록 계산
		int blockCnt = (pgCnt%PageInfo.PAGE_OF_BLOCK==0)?
				       pgCnt/PageInfo.PAGE_OF_BLOCK:
				       pgCnt/PageInfo.PAGE_OF_BLOCK+1;
		
		pgvo.setBlockCnt(blockCnt);
		//startPg
		int startPg = (pgvo.getCurBl()-1)*PageInfo.PAGE_OF_BLOCK+1;
		//endPg
		int endPg = pgvo.getCurBl()*PageInfo.PAGE_OF_BLOCK>pgCnt?
				    pgCnt:pgvo.getCurBl()*PageInfo.PAGE_OF_BLOCK;
		pgvo.setStartPg(startPg);
		pgvo.setEndPg(endPg);
		
		//noticeList
		List<NoticeVo> notiList = noticeDao.getNoticies(nvo);
		reSet.put("noticeTot", noticeTot);
		reSet.put("pgvo", pgvo);
		reSet.put("notiList", notiList);
		return reSet;
	}

	@Override
	public int noticeProc(NoticeVo nvo) {
		return noticeDao.generateNotice(nvo);
	}

	@Transactional
	@Override
	public NoticeVo getNotice(NoticeVo nvo) {
		int r = noticeDao.countUpdate(nvo);
		if(r>0) {
			return noticeDao.getNotice(nvo);
		}else {
			return null; 
		}
	}

	@Override
	public int updateNotice(NoticeVo nvo) {
		return noticeDao.updateNotice(nvo);
	}

	@Override
	public int deleteNotice(NoticeVo nvo) {
		return noticeDao.deleteNotice(nvo);
	}

}
