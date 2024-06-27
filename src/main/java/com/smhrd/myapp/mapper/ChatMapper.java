package com.smhrd.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.myapp.model.Chat;
import com.smhrd.myapp.model.Log;

@Mapper
public interface ChatMapper {

	// 채팅방 정보 저장
	@Insert("insert into CHAT (c_senid,c_recid) value (#{c_senid},#{c_recid})")
	public int chat(Chat chat);
	// 채팅방 정보 조회
	public List<Chat> chatlist(String u_id);
	// 받은 채팅방 정보 조회
	public List<Chat> receivelist(String u_id);
	// 채팅요청 수락
	@Update("update CHAT set c_accept=1 where c_id=#{c_id}")
	public int accept(String c_id);
	// 채팅로그 저장
	@Insert("insert into CHATLOG (cl_c_id,cl_senid,cl_log) value (#{cl_c_id},#{cl_senid},#{cl_log})")
	public int saveLog(Log save);
	// 채팅로그 가져오기
	@Select("select * from CHATLOG where cl_c_id=#{cl_c_id}")
	public List<Log> loadLog(String cl_c_id);
	// 읽음유무 변경
	@Update("UPDATE CHATLOG SET cl_ruread = 1 WHERE cl_c_id = #{c_id} AND cl_senid != #{c_senid}")
    public int updateReadStatus(Chat chat);
	// 안읽은 메세지수 반환
	@Select("select count(*) from CHATLOG where cl_c_id=#{c_id} and cl_senid !=#{u_id} and cl_ruread=0")
	public int noread(Map<String, String> data);
	// 채팅방이 존재하는지 조회
	@Select("select * from CHAT where (c_senid=#{c_senid} and c_recid=#{c_recid}) or (c_senid=#{c_recid} and c_recid=#{c_senid})")
	public Chat chatinquiry(Chat chat);
	
}
