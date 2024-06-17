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
	
	public MavenMember memberLogin(MavenMember member);
	
	@Update("update USERS set u_pw=#{u_pw}, u_nickname=#{u_nickname}, u_name=#{u_name} where u_id=#{u_id}")
	public int memberUpdate(MavenMember member);
	
	@Delete("delete from USERS where u_id=#{u_id}")
	public int memberDelete(String id);
	
	@Select("select * from USERS")
	public List<MavenMember> memberList();
	
	@Insert("insert into USERS values (#{u_id}, #{u_pw}, #{u_nickname})")
	public int chatAdd(String log);
	
}
