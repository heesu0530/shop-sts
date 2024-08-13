package com.ecom6.web.notice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVo;
import com.ecom6.service.notice.NoticeService;
import com.ecom6.vo.mem.MemberVo;
import com.ecom6.vo.notice.NoticeVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
  
  @Autowired
  NoticeService noticeService;
  
  @GetMapping(value = {"/notice", "/admin/notice"})
  public String getNoticeList (HttpServletRequest request,
  HttpServletResponse response,
  NoticeVo nvo,
  Model model,
  PageVo pgvo) {
    String page       = null;
    String contentJsp = null;
    // admin "../notice/NoticeList.jsp";
    // 고객과 방문객은 notice/NoticeList.jsp
    HttpSession           session = request.getSession ();
    MemberVo              ssKey   = (MemberVo)session.getAttribute ("ssKey");
    Map< String, Object > reSet   = noticeService.getNoticies (nvo, pgvo);
    if (ssKey != null) {
      if (ssKey.getMem_role ().equals ("admin")) {
        contentJsp = "../admin/NoticeList.jsp";
        page       = "admin/Main";
      } else {
        contentJsp = "notice/NoticeList.jsp";
        page       = "Main";
      }
    } else {
      contentJsp = "notice/NoticeList.jsp";
      page       = "Main";
    }
    model.addAttribute ("contentJsp", contentJsp);
    model.addAttribute ("noticeTot", reSet.get ("noticeTot"));
    model.addAttribute ("pgvo", reSet.get ("pgvo"));
    model.addAttribute ("noticeList", reSet.get ("notiList"));
    model.addAttribute ("PBlock", PageInfo.PAGE_OF_BLOCK);
    return page;
  }
  
  @GetMapping("/admin/noticeForm")
	public String noticeForm(HttpServletRequest reqeust,
							 PageVo pgvo,
			                 Model model) {
	   //관리자만 (세션을 확인)
		HttpSession session = reqeust.getSession();
		String msg = null;
		String url = null;
		String page=null;
		MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		
		if(ssKey !=null && ssKey.getMem_role().equals("admin")) {
			page = "admin/Main";
			model.addAttribute("contentJsp", "../admin/NoticeForm.jsp");
			session.setAttribute("ssKey", ssKey);
		}else {
			msg="로그인이 필요합니다.";
			url = "/login";
			page = "MsgPage";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
		}
		return page;
	}
  
  @PostMapping("/admin/noticeProc")
  public String noticeProc (HttpServletRequest reqeust,
  NoticeVo nvo,
  PageVo pgvo,
  Model model) {
    HttpSession session = reqeust.getSession ();
    MemberVo    ssKey   = (MemberVo)session.getAttribute("ssKey");
    String      page    = null;
    String      url     = null;
    String      msg     = null;
    if (ssKey != null && ssKey.getMem_role().equals("admin")){
      url = "/notice";
      int r = noticeService.noticeProc(nvo);
      if (r > 0) {
        msg = "공지사항등록 성공";
      } else {
        msg = "공지사항등록 실패";
      }
      session.setAttribute ("ssKey", ssKey);
    } else {
      msg = "로그인이 필요합니다.";
      url = "/login";
    }
    model.addAttribute ("url", url);
    model.addAttribute ("msg", msg);
    page = "MsgPage";
    return page;
    
  }
  
  @GetMapping("/noticeDetail")
  public String noticeDetail (HttpServletRequest reqeust,
  PageVo pgvo,
  Model model,
  NoticeVo nvo) {
    HttpSession session = reqeust.getSession ();
    MemberVo    ssKey   = (MemberVo)session.getAttribute ("ssKey");
    String      page    = null;
    NoticeVo    noti    = noticeService.getNotice (nvo);
    if (ssKey != null && ssKey.getMem_role ().equals ("admin")) {
      session.setAttribute ("ssKey", ssKey);
      page = "admin/Main";
      model.addAttribute ("contentJsp", "../admin/NoticeShow.jsp");
    } else {
      page = "Main";
      model.addAttribute ("contentJsp", "notice/NoticeShow.jsp");
    }
    log.info ("noti==" +noti);
    model.addAttribute ("notice", noti);
    return page;
  }
  
  @PostMapping("notiUpForm")
  public String notiUpForm (HttpServletRequest reqeust,
  PageVo pgvo,
  Model model,
  NoticeVo nvo) {
    HttpSession session = reqeust.getSession ();
    String      page    = null;
    String      url     = null;
    String      msg     = null;
    
    MemberVo ssKey = (MemberVo)session.getAttribute ("ssKey");
    if (ssKey != null && ssKey.getMem_role ().equals ("admin")) {
      model.addAttribute ("notice", nvo);
      model.addAttribute ("contentJsp", "../admin/NotiUpForm.jsp");
      page = "admin/Main";
    } else {
      msg = "세션이 종료되었습니다. \\n로그인이 필요합니다.";
      url = "/login";
      model.addAttribute ("msg", msg);
      model.addAttribute ("url", url);
      page = "MsgPage";
    }
    return page;
  }
  
  @PostMapping("/notiUpProc")
  public String notiUpdateProc(HttpServletRequest request, PageVo pgvo, Model model, NoticeVo nvo) {
      HttpSession session = request.getSession();
      String page;
      String url = null;
      String msg = null;
      MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");

      if (ssKey != null && ssKey.getMem_role().equals("admin")) {
      		url="admin/notice";
          int r = noticeService.updateNotice(nvo);
          if (r > 0) {
              msg = "수정완료";
          } else {
              msg = "수정실패";
          }
          page = "MsgPage";  // 리다이렉트 설정
      } else {
          msg = "세션이 종료되었습니다. \\n로그인이 필요합니다.";
          url = "/login";
          page = "MsgPage";
      }

      model.addAttribute("msg", msg);
      model.addAttribute("url", url);
      return page;
  }
  
  @PostMapping("/notiDelete")
  public String notiDelete(HttpServletRequest request, PageVo pgvo, Model model, NoticeVo nvo) {
      HttpSession session = request.getSession();
      String page = null;
      String url = null;
      String msg = null;
      MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");

      if (ssKey != null && ssKey.getMem_role().equals("admin")) {
          url = "admin/notice";
          try {
              int r = noticeService.deleteNotice(nvo);
              if (r > 0) {
                  msg = "삭제완료";
              } else {
                  msg = "삭제실패";
              }
          } catch (Exception e) {
              e.printStackTrace();
              msg = "삭제 과정에서 오류가 발생했습니다.";
          }
          page = "MsgPage";
      } else {
          msg = "세션이 종료되었습니다. \\n로그인이 필요합니다.";
          url = "/login";
          page = "MsgPage";
      }

      model.addAttribute("msg", msg);
      model.addAttribute("url", url);
      return page;
  }
  
}
