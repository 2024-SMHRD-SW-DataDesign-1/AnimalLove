package com.smhrd.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {
	// index 페이지를 리턴해주는 메서드
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String index() {
		// view resolver : /WEB-INF/views/index.jsp
		return "index";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "page/join";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "page/login";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update() {
		return "page/update";
	}
	
//	@RequestMapping(value="/chat", method=RequestMethod.GET)
//	public String chat() {
//		return "chatting";
//		// return "chatting" => chatting.jsp (WEB-INF/spring/appServlet/servlet-context.xml 에서 설정)
//	}
	@RequestMapping(value="/common/header", method=RequestMethod.GET)
	public String header() {
		return "common/header";
	}
	
	@RequestMapping(value="/location", method=RequestMethod.GET)
	public String location() {
		return "location";
	}
	
	@RequestMapping(value="/map", method=RequestMethod.GET)
	public String map() {
		return "common/map/cookie";
	}
	
	@RequestMapping(value="/information", method=RequestMethod.GET)
	public String information() {
		return "page/information";
	}
//	@RequestMapping(value="/list", method=RequestMethod.GET)
//	public String list() {
//		return "member/list";
//	}
	
	@RequestMapping(value="/chatting/{c_id}", method=RequestMethod.GET)
	public String chatting(@PathVariable("c_id") String c_id, Model model) {
		model.addAttribute("c_id", c_id);
		return "chatting";
	}
	
	@RequestMapping(value="/chatList", method=RequestMethod.GET)
	public String chatList() {
		return "chatList";
	}
	
	// 채팅방리스트 화면
	@RequestMapping(value="/mainchatList", method=RequestMethod.GET)
	public String mainchatList() {
		return "common/chat/chatlist";
	}
	
	//메인 화면
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main() {
		// view resolver : /WEB-INF/views/index.jsp
		return "page/main";
	}
	
	
	//메인 화면
	@RequestMapping(value="/matting", method=RequestMethod.GET)
	public String animalInfo() {
		// view resolver : /WEB-INF/views/index.jsp
		return "page/animalInfo";
	}
	
	//메인 화면
	@RequestMapping(value="/matting_pic", method=RequestMethod.GET)
	public String animalInfo2() {
		// view resolver : /WEB-INF/views/index.jsp
		return "page/animalInfo2";
	}
	
	//ID찾기
		@RequestMapping(value="/findid", method=RequestMethod.GET)
		public String findId() {
			// view resolver : /WEB-INF/views/index.jsp
			return "page/findId";
		}
	
	
	
}

