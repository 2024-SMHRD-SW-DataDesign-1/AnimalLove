package com.smhrd.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.myapp.model.MavenMember;

@Mapper
public interface MemberMapper {
	// 회원가입 처리
	public int memberJoin(MavenMember member);

	// 아이디 중복체크
	public int idChk(String id);

	// 낙네임 중복체크
	public int nickChk(String nickname);

	// 이메일 중복체크
	public int emailChk(String email);

	public MavenMember memberLogin(MavenMember member);

	@Update("UPDATE USERS SET u_pw=#{u_pw}, u_nickname=#{u_nickname}, u_address=#{u_address}, u_email=#{u_email} WHERE u_id=#{u_id}")
	public int memberUpdate(MavenMember member);

	@Delete("delete from USERS where u_id=#{u_id}")
	public int memberDelete(String id);

	@Select("select * from USERS")
	public List<MavenMember> memberList();

	@Insert("insert into USERS values (#{u_id}, #{u_pw}, #{u_nickname})")
	public int chatAdd(String log);

}
