package com.smhrd.myapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.myapp.mapper.MemberMapper;
import com.smhrd.myapp.model.MavenMember;

@Service
public class MemberService {
	
	@Autowired //의존성 주입
	MemberMapper mapper;
	
	
	// 회원가입 처리
	public int memberJoin(MavenMember member)
	{
		return mapper.memberJoin(member);
	}
	
	// 로그인 처리
	public MavenMember memberLogin(MavenMember member)
	{
		return mapper.memberLogin(member);
	}
	
	// 회원정보수정
	public int memberUpdate(MavenMember member)
	{
		return mapper.memberUpdate(member);
	}
	
	// 회원탈퇴 처리
	public int memberDelete(String id)
	{
		return mapper.memberDelete(id);
	}
	
	
	// 회원 전체 리스트 처리
	public List<MavenMember> memberList()
	{
		return mapper.memberList();
	}
	
	// chat add
	public int chatAdd(String log)
	{
		return mapper.chatAdd(log);
	}
}
