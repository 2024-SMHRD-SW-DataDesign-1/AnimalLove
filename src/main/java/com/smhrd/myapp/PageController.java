package com.smhrd.myapp;

import javax.print.attribute.SetOfIntegerSyntax;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.myapp.model.Animal;
import com.smhrd.myapp.model.MavenMember;
import com.smhrd.myapp.service.AnimalService;

@Controller
public class PageController {
	// index 페이지를 리턴해주는 메서드
	@Autowired
	AnimalService service;
	

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		// view resolver : /WEB-INF/views/index.jsp
		return "index";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "page/join";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "page/login";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request) {
		// 로그인 세션 가져오기
		HttpSession session = request.getSession();
		// 로그인 세션에서 값 가져오기 --> 로그인 당시 정보
		MavenMember member2 = (MavenMember) session.getAttribute("member");
		if (member2 != null) { // 로그인 상태
			return "page/update";
		} else { // 로그인 안한상태
			return "page/login";
		}
		
	}

	@RequestMapping(value = "/common/header", method = RequestMethod.GET)
	public String header() {
		return "common/header";
	}

	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public String location() {
		return "location";
	}

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map() {
		return "common/map/cookie";
	}

	@RequestMapping(value = "/information", method = RequestMethod.GET)
	public String information() {
		return "page/information";
	}

	@RequestMapping(value = "/chatting/{c_id}", method = RequestMethod.GET)
	public String chatting(@PathVariable("c_id") String c_id, Model model) {
		model.addAttribute("c_id", c_id);
		return "chatting";
	}

//	@RequestMapping(value = "/chatList", method = RequestMethod.GET)
//	public String chatList() {
//		return "chatList";
//	}

	// 채팅방리스트 화면
	@RequestMapping(value = "/mainchatList", method = RequestMethod.GET)
	public String mainchatList() {
		return "common/chat/chatlist";
	}

	// 메인 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		// view resolver : /WEB-INF/views/index.jsp
		return "page/main";
	}

	// 매칭화면
	@RequestMapping(value = "/matching", method = RequestMethod.GET)
	public String animalInfo(HttpServletRequest request) {
		// 로그인 세션 가져오기
		HttpSession session = request.getSession();
		// 로그인 세션에서 값 가져오기 --> 로그인 당시 정보
		MavenMember member2 = (MavenMember) session.getAttribute("member");
		// DB에 동물정보 존재하면 선호도 페이지로 이동
		if (member2 == null) {
			return "page/login";
		}else { // 로그인 상태
			int res = service.selectanimal(member2.getU_id());
			if(res==1) {
				return "redirect:/prfInfo";
			}else {
				return "page/animalInfo";				
			}
		} 
		// view resolver : /WEB-INF/views/index.jsp

	}

	// 매칭화면2
	@RequestMapping(value = "/matching_pic", method = RequestMethod.POST)
	public String animalInfo2(Animal animal, HttpSession session) {
		// view resolver : /WEB-INF/views/index.jsp
		session.setAttribute("animal", animal);
		Animal tem = (Animal) session.getAttribute("animal");
		return "page/animalInfo2";
	}

	// ID찾기
	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public String findId() {
		// view resolver : /WEB-INF/views/index.jsp
		return "page/findId";
	}
	
	// 선호도
	@RequestMapping(value = "/prfInfo", method = RequestMethod.GET)
	public String prfInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MavenMember member = (MavenMember) session.getAttribute("member");
		int res = service.prfSelect(member.getU_id());
		System.out.println(res);
		if (res == 0){
			return "page/prfInfo";			
		}else {
			return "page/matProfile";
		}
	}
	
	//프로필 약식 화면
	@RequestMapping(value = "/matProfile", method = RequestMethod.GET)
	public String matProfile() {
		// view resolver : /WEB-INF/views/index.jsp
		return "page/matProfile";
	}

}
