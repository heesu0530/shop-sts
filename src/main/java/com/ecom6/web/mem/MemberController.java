package com.ecom6.web.mem;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecom6.service.mem.MemberService;
import com.ecom6.vo.mem.MemberVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;

	@GetMapping("/login")
	public String login() {
		return "member/Login";   
	}
	
	@PostMapping(value = { "loginProc", "/admin/loginProc" })
	public String loginProc(HttpServletRequest request, HttpServletResponse response, MemberVo mvo, Model model) {
		// 세션갖고오기
		HttpSession session = request.getSession();
		String msg = null;
		String url = "/";
		String page = null;
		// 회원정보를 가져오기
		MemberVo memberVo = memberService.getMember(mvo);
		// 세션에 정보 저장
		if (memberVo != null) {
			if (memberVo.getMem_role().equals("admin")) {
				url = "/admin";
			} else if (memberVo.getMem_role().equals("mem")) {
				page = "redirect:/";
			}
			MemberVo ssKey = memberVo;
			msg = memberVo.getMem_name() + "님 반갑습니다.";
			session.setAttribute("ssKey", ssKey);
		} else {
			msg = "아이디 또는 패스워드가 잘못되었습니다.";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "MsgPage";
	}
	@PostMapping(value = { "logoutProc", "/admin/logoutProc" })
	public String logoutProc(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("ssKey");
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping(value = { "logoutProc", "/admin/logoutProc" })
	public String getLogoutProc(HttpServletRequest request) {
		return logoutProc(request);
	}
	
	// 아이디 비밀번호찾기 ★★★★★★
		@GetMapping("/searchinfo")
		public String getSearchinfo(HttpServletRequest request, HttpServletResponse response, MemberVo mvo, Model model) {

			String page = null;
			page = "/member/SearchPage";

			return page;
		}

		@PostMapping("/searchinfo")
		public String postMemSearch(HttpServletRequest request, HttpServletResponse response, MemberVo mvo, Model model) {
			return getSearchinfo(request, response, mvo, model);
		}

		@PostMapping("/searchProc")
		public String searchProc(HttpServletRequest request, HttpServletResponse response, MemberVo mvo, Model model) {
			int r = 0;
			String id = null;
			String msg = null;
			String url = "/";
			log.info("mvo=======>" + mvo);
			if (mvo != null) {
				if (mvo.getMem_id() != null) { // 비밀번호 설정
					r = memberService.updatePasswd(mvo);
					if (r > 0) {
						msg = "비밀번호가 변경되었습니다";
					} else {
						msg = "비밀번호 변경중에 오류가 발생했습니다 \\n 관리자에게 문의부탁드립니다";
					}
				} else { // 아이디 찾아서 리턴
					id = memberService.searchId(mvo);
					if (id != null)
						msg = "회원아이디: " + id;
					else
						msg = "회원정보가 없습니다";
					url = "searchinfo";
				}
			}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "MsgPage";
		}
		
		@PostMapping("idCheck")
		@ResponseBody
		public int idCheck(MemberVo mvo) {
			int cnt = 0;
			if (mvo.getMem_id() != null) {
				cnt = memberService.idCheck(mvo.getMem_id());
			}
			return cnt;
		}

		@GetMapping("idCheck")
		public int getIdCheck(MemberVo mvo) {
			return idCheck(mvo);
		}
   
		@GetMapping("/signup")
		public String signupPage(HttpServletRequest request, HttpServletResponse response) {

			String page = null;
			page = "/member/SignUpPage";
			return page;
		}
		@PostMapping(value = { "signinProcess", "/admin/signinProcess" })
		public String signinProcess(HttpServletRequest request, HttpServletResponse response, MemberVo mvo, Model model) {
			// 세션갖고오기
			HttpSession session = request.getSession();
			String msg = null;
			String url = "/";
			// 회원정보를 가져오기
			MemberVo svo = memberService.getMember(mvo);
			// 세션에 정보 저장
			if (svo != null) {
				if (svo.getMem_role().equals("admin")) {
					url = "/admin/";
				}
				MemberVo ssKey = svo;
				msg = svo.getMem_name() + "님 반갑습니다.";
				session.setAttribute("ssKey", ssKey);
			} else {
				msg = "아이디 또는 패스워드가 잘못되었습니다.";
			}
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			return "MsgPage";
		}

		@Transactional
		@PostMapping("/signUpCompleteProcess")
		public String signUpCompleteProcess(HttpServletRequest request, HttpServletResponse response, MemberVo mvo,
				Model model) {
			String msg = null;
			String url = "/login";
			int r = memberService.memberJoin(mvo);
			if (r > 0) {
				msg = "회원가입을 축하합니다.";
			} else {
				msg = "회원가입을 실패했습니다.\\n관리자에게 문의바랍니다.";
			}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "MsgPage";
		}
		
		@PostMapping(value = { "SignoutProcess", "/admin/SignoutProcess" })
		public String SignoutProcess(HttpServletRequest request) {
			HttpSession session = request.getSession();
			session.removeAttribute("ssKey");
			session.invalidate();
			return "redirect:/";
		}

		@GetMapping(value = { "SignoutProcess", "/admin/SignoutProcess" })
		public String getSignoutProcess(HttpServletRequest request) {
			return SignoutProcess(request);
		}
		@GetMapping("/info")
		public String info(HttpServletRequest request, Model model) {
			   HttpSession session = request.getSession();
			   MemberVo mvo = (MemberVo) session.getAttribute("ssKey");
			   String page = null;
			   String url=null;
			   String msg = null;
			   if(mvo!=null) {
				   model.addAttribute("mvo", mvo);
				   model.addAttribute("contentJsp", "member/MemberInfo.jsp");
				   page="Main";
			   }else{
				   msg = "세션이 종료되었습니다.\\n 재로그인이 필요합니다.";
				   url="/";
				   page = "MsgPage";
				   model.addAttribute("url", url);
				   model.addAttribute("msg", msg);
			   }
			return "/member/MemberInfo";
		}

   @GetMapping("/admin/info")
   public String memeberInfo(HttpServletRequest request,
 		  HttpServletResponse response,
 		  MemberVo mvo,//커스텀 정보
 		  Model model) {
 	     String page=null;
 	     String msg =null;
 	     String url=null;
 		 HttpSession session = request.getSession();
 		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
     	  if(ssKey!=null) {
 				if(ssKey.getMem_role().equals("admin")) {
 					model.addAttribute("mvo", ssKey);
 					model.addAttribute("contentJsp", "../member/MemberInfo.jsp");
 					page="admin/Main";
 				}else {
 				 session.removeAttribute("ssKey");
 				 session.invalidate();
 				 msg="접근이 올바르지 않습니다.";
 				 url = "/login";
 				 page="MsgPage";
 				 model.addAttribute("msg", msg);
 				 model.addAttribute("url", url);
 				}
 			  }else {
 			    session.removeAttribute("ssKey");
 				session.invalidate();
 				msg="세션이 종료되었습니다.\\n 재로그인 필요합니다.";
 			    url = "/login";
 			    page="MsgPage";
 			    model.addAttribute("msg", msg);
 			    model.addAttribute("url", url);
 			  }
 			  return page;
 			  
      }
   @PostMapping("/admin/memUpdateForm")
   public String adminUpdateForm(HttpServletRequest request,
		   Model model) {
	     HttpSession session = request.getSession();
	     String page=null;
	     String msg =null;
	     String url=null;
		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		 if(ssKey!=null) {
			if(ssKey.getMem_role().equals("admin")) {
				model.addAttribute("mvo", ssKey);
				model.addAttribute("contentJsp", "../member/MemberUpdateInfo.jsp");
				page="admin/Main";
			}else {
			 session.removeAttribute("ssKey");
			 session.invalidate();
			 msg="접근이 올바르지 않습니다.";
			 url = "/login";
			 page="MsgPage";
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			}
		  }else {
		    session.removeAttribute("ssKey");
			session.invalidate();
			msg="세션이 종료되었습니다.\\n 재로그인 필요합니다.";
		    url = "/login";
		    page="MsgPage";
		    model.addAttribute("msg", msg);
		    model.addAttribute("url", url);
		  }
		  return page;
   }
   
   @GetMapping("/infoUpdate")
	public String getInfoUpdate(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberVo mvo = (MemberVo) session.getAttribute("ssKey");
		model.addAttribute("mvo", mvo);
		model.addAttribute("contentJsp", "member/MemberUpdateInfo.jsp");
		return "member/MemberUpdateInfo";
	}
   
   @PostMapping("/memUpdateForm")
   public String updateForm(HttpServletRequest request, Model model) {
	   HttpSession session = request.getSession();
	   MemberVo mvo = (MemberVo) session.getAttribute("ssKey");
	   model.addAttribute("mvo", mvo);
	   model.addAttribute("contentJsp", "member/MemberUpdateInfo.jsp");
	   return "Main";
   }
   
   
   @PostMapping("/memberUpdate")
   public String memUpdateProc(HttpServletRequest request,
           HttpServletResponse response,
           MemberVo mvo,
           Model model) {
	   HttpSession session = request.getSession();
	   String msg;
	   int r = memberService.memberUpdate(mvo);
	   if(r>0) {
		   msg = "회원정보가 수정되었습니다. \\n 재 로그인이 필요합니다.";
	   }else {
		   msg = "회원정보가 수정을 실패했습니다.\\n관리자에게 문의바랍니다.";
	   }
	   session.removeAttribute("ssKey");
	   session.invalidate();
	   model.addAttribute("msg", msg);
	   model.addAttribute("url", "/");
	   return "MsgPage";
   }
   
   @PostMapping("/admin/memUpdateProc")
   public String adminUpdateProc(HttpServletRequest request,
		   HttpServletResponse response,
		   MemberVo mvo,
		   Model model) {
	     HttpSession session = request.getSession();
	     String page=null;
	     String msg =null;
	     String url=null;
		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		 if(ssKey!=null) {
			if(ssKey.getMem_role().equals("admin")) {
				int r = memberService.memberUpdate(mvo);
				if(r>0) {
					msg="관리자 정보 수정완료\\n 재로그인이 필요함";
				}else {
					msg="관리자 정부 수정실패\\n 담당자에게 문의바람";
				}
				session.removeAttribute("ssKey");
				session.invalidate();
				url = "/login";
				 model.addAttribute("msg", msg);
				 model.addAttribute("url", url);
				page="MsgPage";
			}else {
			 session.removeAttribute("ssKey");
			 session.invalidate();
			 msg="접근이 올바르지 않습니다.";
			 url = "/login";
			 page="MsgPage";
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			}
		  }else {
			  page="redirect:/";
		  }
		  return page;
   }
   
  @GetMapping("/memberMgt")
  public String memberMgt(HttpServletRequest request,
          HttpServletResponse response,
          MemberVo mvo,
          Model model) {
	     String page=null;
	     String msg =null;
	     String url=null;
		 HttpSession session = request.getSession();
		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		 if(ssKey!=null) {
			if(ssKey.getMem_role().equals("admin")) {
				 Map<String, Object> reSet= memberService.getMemberList(mvo);
	        	   msg = (String) reSet.get("msg");
	        	   model.addAttribute("memberTot", reSet.get("memberTot"));
	        	   model.addAttribute("members",reSet.get("members"));
	        	   model.addAttribute("contentJsp", "./MemberList.jsp");
				page="admin/Main";
			}else {
			 session.removeAttribute("ssKey");
			 session.invalidate();
			 msg="접근이 올바르지 않습니다.";
			 url = "/login";
			 page="MsgPage";
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			}
		  }else {
		    session.removeAttribute("ssKey");
			session.invalidate();
			msg="세션이 종료되었습니다.\\n 재로그인 필요합니다.";
		    url = "/login";
		    page="MsgPage";
		    model.addAttribute("msg", msg);
		    model.addAttribute("url", url);
		  }
		  return page;
  }
  
  @PostMapping("/memberMgt")
  public String postMemberMgt(HttpServletRequest request,
		  HttpServletResponse response,
		  MemberVo mvo,
		  Model model) {
     return memberMgt(request, response, mvo, model);
  }
  @GetMapping("/customInfo")
  public String getCustomInfo(HttpServletRequest request,
		  HttpServletResponse response,
		  MemberVo mvo,//커스텀 정보
		  Model model) {
	  return  customInfo(request,response,mvo,model) ;
  }
  @PostMapping("/customInfo")
  public String customInfo(HttpServletRequest request,
		  HttpServletResponse response,
		  MemberVo mvo,//커스텀 정보
		  Model model) {
	     String page=null;
	     String msg =null;
	     String url=null;
		 HttpSession session = request.getSession();
		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		 if(ssKey!=null) {
			if(ssKey.getMem_role().equals("admin")) {
				model.addAttribute("mvo", mvo);
				model.addAttribute("contentJsp", "./MemberInfo.jsp");
				page="admin/Main";
			}else {
			 session.removeAttribute("ssKey");
			 session.invalidate();
			 msg="접근이 올바르지 않습니다.";
			 url = "/login";
			 page="MsgPage";
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			}
		  }else {
		    session.removeAttribute("ssKey");
			session.invalidate();
			msg="세션이 종료되었습니다.\\n 재로그인 필요합니다.";
		    url = "/login";
		    page="MsgPage";
		    model.addAttribute("msg", msg);
		    model.addAttribute("url", url);
		  }
		  return page;
  }
 
  @PostMapping("/memDelete")
  public String memDelete(HttpServletRequest request,
		   Model model) {
	   log.info("delete");
	   HttpSession session = request.getSession();
	   String page=null;
	   String msg =null;
	   String url=null;
	   MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
	   if(ssKey!=null) {
		   int r = memberService.memDelete(ssKey);
		   if(r>0) {
			   msg = "회원정보가 정상적으로 삭제되었습니다.\\n 고맙습니다.";
		   }else {
			   msg = "회원정보가 삭제를 실패했습니다.\\n 주문이 미완료되었습니다.\\n관리자에게 문의바랍니다.";
		   }
		   session.removeAttribute("ssKey");
		   session.invalidate();
		}else {
		  session.removeAttribute("ssKey");
		  session.invalidate();
		  msg="접근이 올바르지 않습니다.";
		 }
	   url = "/";
	   page="MsgPage";
	   model.addAttribute("msg", msg);
	   model.addAttribute("url", url);
	   return page;
  }
}





