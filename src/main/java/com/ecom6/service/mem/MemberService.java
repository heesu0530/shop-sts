package com.ecom6.service.mem;

import java.util.Map;

import com.ecom6.vo.mem.MemberVo;

public interface MemberService {

	MemberVo getMember(MemberVo mvo);

	int idCheck(String mem_id);

	int memberJoin(MemberVo mvo);

	int memberUpdate(MemberVo mvo);

	Map<String, Object> getMemberList(MemberVo mvo);

	int memDelete(MemberVo ssKey);

	int updatePasswd(MemberVo mvo);

	String searchId(MemberVo mvo);

}
