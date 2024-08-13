package com.ecom6.service.notice;

import java.util.Map;

import com.ecom6.common.vo.PageVo;
import com.ecom6.vo.notice.NoticeVo;

public interface NoticeService {

	Map<String, Object> getNoticies(NoticeVo nvo, PageVo pgvo);

	int noticeProc(NoticeVo nvo);

	NoticeVo getNotice(NoticeVo nvo);

	int updateNotice(NoticeVo nvo);

	int deleteNotice(NoticeVo nvo);

}
