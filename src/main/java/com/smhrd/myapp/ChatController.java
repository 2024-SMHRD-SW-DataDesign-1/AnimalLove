package com.smhrd.myapp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.myapp.model.Chat;
import com.smhrd.myapp.model.Log;
import com.smhrd.myapp.model.MavenMember;
import com.smhrd.myapp.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	ChatService service;	
	
	// 채팅요청
		@RequestMapping(value = "/member/call", method = RequestMethod.POST)
		public String call(@RequestParam("c_recid") String c_recid, HttpSession session) {
			MavenMember member = (MavenMember) session.getAttribute("member");
			Chat chat = new Chat();
			chat.setC_senid(member.getU_id());
			chat.setC_recid(c_recid);
			System.out.println(chat.getC_senid());
			System.out.println(chat.getC_recid());
			int res = service.chat(chat);
			return "redirect:/index";
		}

		// 채팅목록 출력
		@RequestMapping(value = "/member/chatlist/{u_id}", method = RequestMethod.GET)
		public String chatlist(@PathVariable("u_id") String u_id, Model model) {
			List<Chat> sendlist = service.chatlist(u_id);
			List<Chat> receivelist = service.receivelist(u_id);
						
			model.addAttribute("chatlist", sendlist);
			model.addAttribute("receivelist", receivelist);
			return "common/chat/chatlist";
		}

		// 채팅 요청 수락
		@RequestMapping(value = "/member/accept/{c_recid}", method = RequestMethod.GET)
		public String chatlist(@PathVariable("c_recid") String c_recid) {
			service.accept(c_recid);
			return "redirect:/member/chatlist/" + c_recid;
		}

		// 로그 저장
		@RequestMapping(value = "/chat/send", method =RequestMethod.POST, consumes="application/json;")
		public @ResponseBody void saveLog(@RequestBody String cl_log) throws JsonMappingException, JsonProcessingException {
			ObjectMapper mapper = new ObjectMapper();
	        Log log = mapper.readValue(cl_log, Log.class);
	        
			int res = service.saveLog(log);
			System.out.println(res);
		}
		
		// 로그 가져오기
		@RequestMapping(value = "/chat/roadLog", method =RequestMethod.POST, consumes="application/json;", produces = "application/text; charset=UTF-8")
		public @ResponseBody String loadLog(@RequestBody String cl_c_id) throws JsonMappingException, JsonProcessingException {
			ObjectMapper mapper = new ObjectMapper();
	        Log log = mapper.readValue(cl_c_id, Log.class);
	        
			List<Log> returnLog = service.loadLog(log.getCl_c_id());
			
			ObjectMapper om = new ObjectMapper();
			String jsonString = om.writeValueAsString(returnLog);
			
			return jsonString;
		}
		
	
}
