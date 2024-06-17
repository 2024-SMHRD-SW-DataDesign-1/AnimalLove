package com.smhrd.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.myapp.model.Chat;
import com.smhrd.myapp.model.Log;

@Mapper
public interface ChatMapper {

	@Insert("insert into CHAT (c_senid,c_recid) value (#{c_senid},#{c_recid})")
	public int chat(Chat chat);
	
	@Select("select * from CHAT where c_senid=#{u_id}")
	public List<Chat> chatlist(String u_id);
	
	@Select("select * from CHAT where c_recid=#{u_id}")
	public List<Chat> receivelist(String u_id);
	
	@Update("update CHAT set accept=1 where c_recid=#{c_recid}")
	public int accept(String c_recid);
	
	@Insert("insert into CHATLOG (cl_c_id,cl_senid,cl_log) value (#{cl_c_id},#{cl_senid},#{cl_log})")
	public int saveLog(Log save);
	
	@Select("select * from CHATLOG where cl_c_id=#{cl_c_id}")
	public List<Log> loadLog(String cl_c_id);
}