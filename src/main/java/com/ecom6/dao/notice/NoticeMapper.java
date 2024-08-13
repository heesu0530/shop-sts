package com.ecom6.dao.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecom6.vo.notice.NoticeVo;

@Mapper
public interface NoticeMapper {

	int getTotalNotice();
	
	List<NoticeVo> getNoticies(NoticeVo nvo);
    
	int generateNotice(NoticeVo nvo);
	
  NoticeVo getNotice(NoticeVo nvo);
	
	int updateNotice(NoticeVo nvo);
	
	int countUpdate(NoticeVo nvo);
	
	int deleteNotice(NoticeVo nvo);
}
