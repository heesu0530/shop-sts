package com.ecom6.web.qna;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVo;
import com.ecom6.service.qna.QnaService;
import com.ecom6.vo.mem.MemberVo;
import com.ecom6.vo.qna.QnaVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaController {

	@Autowired
	QnaService qnaService;

	@GetMapping(value = {"/qnaList", "/admin/qnaList"})
	public String getQnaList(HttpServletRequest request, HttpServletResponse response, QnaVo qvo, Model model, PageVo pgvo) {
	    String page = null;
	    String contentJsp = null;
	    HttpSession session = request.getSession();
	    MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
	    Map<String, Object> reSet = qnaService.getQnaLists(qvo, pgvo);
	    if (ssKey != null) {
	        if (ssKey.getMem_role().equals("admin")) {
	            contentJsp = "../admin/QnaList.jsp";
	            page = "admin/Main";
	        } else {
	            contentJsp = "qna/QnaList.jsp";
	            page = "Main";
	        }
	    } else {
	        contentJsp = "qna/QnaList.jsp";
	        page = "Main";
	    }

	    model.addAttribute("contentJsp", contentJsp);
	    model.addAttribute("qanTot", reSet.get("qanTot"));
	    model.addAttribute("pgvo", reSet.get("pgvo"));
	    model.addAttribute("qnaList", reSet.get("qnaList"));
	    model.addAttribute("PBlock", PageInfo.PAGE_OF_BLOCK);

	    return page;
	}

	@GetMapping(value = { "/qnaWriteForm", "/admin/qnaWriteForm" })
	public String qnaWriteForm(HttpServletRequest request, PageVo pgvo, Model model, QnaVo qvo) {
	    HttpSession session = request.getSession();
	    MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
	    String page = null;

	    if (ssKey != null) {
	        if ("admin".equals(ssKey.getMem_role())) {
	            page = "admin/Main";
	            model.addAttribute("contentJsp", "/WEB-INF/views/admin/QnaWriteForm.jsp");
	        } else {
	            page = "Main";
	            model.addAttribute("contentJsp", "/WEB-INF/views/qna/QnaWriteForm.jsp");
	        }
	        session.setAttribute("ssKey", ssKey);
	        log.info("ssKey==>"+ssKey);
	    } else {
	        model.addAttribute("msg", "로그인이 필요합니다.");
	        model.addAttribute("url", "/login");
	        return "redirect:/login"; // 로그인 페이지로 리다이렉트
	    }
	    
	    return page;
	}
	@PostMapping(value = {"/qnaProc", "/admin/qnaProc"})
	public String qnaProc(HttpServletRequest request, QnaVo qvo, PageVo pgvo, Model model) {
	    HttpSession session = request.getSession();
	    MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
	    String url=null;
	    String msg =null;
	    // 세션 체크 및 관리자 확인
	    if (ssKey != null) {
        qvo.setIp(request.getRemoteAddr()); // IP 주소 설정
        int r = qnaService.qnaProc(qvo); // 문의글 등록 처리
        if (r > 0) {
            msg = "문의글 등록 성공";
            url = "/qnaList"; // 성공 시 이동할 URL
        } else {
            msg = "문의글 등록 실패\n관리자에게 문의 바랍니다.";
            url = "/qnaWrite"; // 실패 시 돌아갈 페이지
        }
	   
	    } else {
	        msg = "로그인 정보가 없습니다.";
	        url = "/login"; // 세션이 없는 경우 로그인 페이지로
	    }

	    // 모델에 메시지와 URL 추가
	    model.addAttribute("msg", msg);
	    model.addAttribute("url", url);
	    
	    // 메시지 페이지로 이동
	    return "MsgPage";
	}

	@GetMapping(value = { "/qnaDetail", "/admin/qnaDetail" })
	public String qnaDetail(HttpServletRequest reqeust, PageVo pgvo, Model model, QnaVo qvo) {
		HttpSession session = reqeust.getSession();
		MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		String url = null; // 기본 페이지 설정
		String page = null;
		QnaVo qnas = qnaService.getqnas(qvo);
		if (ssKey != null && ssKey.getMem_role().equals("admin")) {
			session.setAttribute("ssKey", ssKey);
			page = "admin/Main";
			model.addAttribute("contentJsp", "../admin/QnaShow.jsp");
		} else {
			page = "Main";
			model.addAttribute("contentJsp", "./qna/QnaShow.jsp");
		}
		model.addAttribute("qnaList", qnas);
		model.addAttribute("page", page);
		model.addAttribute("url", url);
		return page;
	}

	@PostMapping("/qnaUpdateForm")
	public String qnaUpdateForm(HttpServletRequest request, PageVo pgvo, Model model, QnaVo qvo) {
		HttpSession session = request.getSession();
		String page = null;
		String url = null;
		String msg = null;
		MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		if (ssKey != null) {
			if (ssKey.getMem_role().equals("admin")) {// 관리자
				model.addAttribute("contentJsp", "../admin/QnaUpdateForm.jsp");
				model.addAttribute("qvo", ssKey);
				page = "admin/Main";
			} else {// 사용자
				// service, ser---
				model.addAttribute("contentJsp", "./qna/QnaUpdateForm.jsp");
				page = "Main";
			}
		} else {
			/// 세션이 죽었을 때
			msg = "세션이 종료되었습니다. \\n로그인이 필요합니다.";
			url = "/login";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			page = "MsgPage";
		}
		model.addAttribute("qvo", qvo);
		url = "/login";
		return page;
	}

	@RequestMapping(value = "/qnaUpdateProc", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnaUpdateProc(HttpServletRequest request, PageVo pgvo, Model model, QnaVo qvo) {
		HttpSession session = request.getSession();
    String page = "MsgPage";
    String url = null;
    String msg = null;
    MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");

    if (ssKey != null) {
        log.info("ssKey======>" + ssKey);
        int r = qnaService.updateQna(qvo); // QnA 수정 처리
        if (r > 0) {
            msg = "수정 완료";
            url = "/qnaList"; // 성공 시 이동할 URL
        } else {
            msg = "수정 실패";
            url = "/qnaUpdateForm"; // 실패 시 돌아갈 페이지
        }
    } else {
        msg = "로그인이 필요합니다.";
        url = "/login"; // 세션이 없거나 권한이 없는 경우
    }

    model.addAttribute("msg", msg);
    model.addAttribute("url", url);
    return page; // 메시지 페이지 반환
}

	@GetMapping("qnaPwCheck")
	public String pwCheck(HttpServletRequest request, HttpServletResponse response) {
		return "popup/QnaPwCheckPopup";
	}

	@PostMapping("/qnaDelete")
	@RequestMapping(value = "/qnaDelete", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnaDelete(HttpServletRequest request, PageVo pgvo, Model model, QnaVo qvo) {
	    HttpSession session = request.getSession();
	    String page = null; // 기본 페이지 설정
	    String url = null;
	    String msg = null;
	    MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");

	    if (ssKey != null) { // 회원인 경우
	        if (ssKey.getMem_role().equals("admin")) { // 관리자인 경우
	            int r = qnaService.deleteQna(qvo);
	            if (r > 0) {
	                msg = "관리자 권한으로 삭제 완료";
	            } else {
	                msg = "관리자 권한으로 삭제 실패";
	            }
	        } else {
	            msg = "권한이 없습니다.";
	        }
	    } else { // 비회원인 경우
	        msg = "로그인 후 이용 가능합니다.";
	    }
	    url = "/qnaList";
	    page = "MsgPage";
	    model.addAttribute("msg", msg);
	    model.addAttribute("url", url);
	    return page;
	}

}