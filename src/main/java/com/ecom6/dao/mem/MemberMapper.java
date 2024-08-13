package com.ecom6.dao.mem;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ecom6.vo.mem.MemberVo;

@Mapper
public interface MemberMapper {

	MemberVo getMember(MemberVo mvo);

	int idCheck(String mem_id);

	int memberJoin(MemberVo mvo);

	int memberUpdate(MemberVo mvo);

	int getMemberTot();

	ArrayList<MemberVo> getMemberList(MemberVo mvo);
    
	int memDelete(MemberVo mvo);

	int updatePasswd(MemberVo mvo);

	String searchId(MemberVo mvo);

}
