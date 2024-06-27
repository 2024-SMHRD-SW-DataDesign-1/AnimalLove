package com.smhrd.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.myapp.mapper.ChatMapper;
import com.smhrd.myapp.model.Chat;
import com.smhrd.myapp.model.Log;

@Service
public class ChatService {

	@Autowired //의존성 주입
	ChatMapper mapper;
	
	// 채팅방 정보 저장
	public int chat(Chat chat) {
		return mapper.chat(chat);
	}
	// 채팅방 정보 조회
	public List<Chat> chatlist(String u_id) {
		return mapper.chatlist(u_id);
	}
	// 받은 채팅방 정보 조회
	public List<Chat> receivelist(String u_id) {
		return mapper.receivelist(u_id);
	}
	// 채팅요청 수락
	public int accept(String c_id) {
		return mapper.accept(c_id);
	}
	// 채팅로그 저장
	public int saveLog(Log save) {
		return mapper.saveLog(save);
	}
	// 채팅로그 가져오기
	public List<Log> loadLog(String cl_c_id) {
		return mapper.loadLog(cl_c_id);
	}
	// 읽음유무 변경
	public int ruread(Chat chat) {
        return mapper.updateReadStatus(chat);
    }
	// 안읽은 메세지수 반환
	public int noread(Map<String, String> data) {
		return mapper.noread(data);
	}
	// 채팅방이 존재하는지 조회
	public int chatinquiry(Chat chat) {
		Chat result = mapper.chatinquiry(chat);
		if(result!=null) {
			return 1;
		}else {
			return 0;
		}
	}
}
