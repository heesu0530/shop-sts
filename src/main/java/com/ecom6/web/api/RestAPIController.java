/*
 * package com.ecom6.web.api;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.ResponseBody; import
 * org.springframework.web.bind.annotation.RestController;
 * 
 * import com.ecom6.service.mem.MemberService; import com.ecom6.vo.mem.MemberVo;
 * 
 * @RestController public class RestAPIController {
 * 
 * @Autowired MemberService memberService;
 * 
 * @PostMapping("idCheck")
 * 
 * @ResponseBody public int idCheck (MemberVo mvo) { int cnt = 0; if
 * (mvo.getMem_id () != null) { cnt = memberService.idCheck (mvo.getMem_id ());
 * } return cnt; } }
 */