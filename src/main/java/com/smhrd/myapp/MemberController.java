package com.smhrd.myapp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.cj.log.Log;
import com.smhrd.myapp.model.Check;
import com.smhrd.myapp.model.MavenMember;
import com.smhrd.myapp.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	// 회원가입 요청 처리 : localhost:8089/aniting/join

	@RequestMapping(value = "/member/join", method = RequestMethod.POST)
	public String memberJoin(@ModelAttribute MavenMember member) {

		int idChkResult = service.idChk(member.getU_id());
		int nickChkResult = service.nickChk(member.getU_nickname());
		int emailChkResult = service.emailChk(member.getU_email());

		try {
			if (emailChkResult == 1 || nickChkResult == 1 || idChkResult == 1) {
				return "page/join";
			} else if (emailChkResult == 0 && nickChkResult == 0 && idChkResult == 0) {
				service.memberJoin(member);
				return "page/login";
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/index";
//		int res = service.memberJoin(member);
//
//		if (res > 0) {
//			return "redirect:/login";
//		} else {
//			return "redirect:/join";
//		}

	}

	// 아이디 중복체크 처리
	@RequestMapping(value = "/member/idChk", method = RequestMethod.POST, consumes="application/json;")
	public @ResponseBody String idChk(@RequestBody String u_id) throws JsonMappingException, JsonProcessingException {
		// String 형식으로 json 타입 값을 받음
		// 받은 u_id 를 MavenMemver 타입으로 매칭
		ObjectMapper mapper = new ObjectMapper();
        MavenMember tmp = mapper.readValue(u_id, MavenMember.class);
        // MavenMemver 에서 u_id값 가지고 옴
        u_id = tmp.getU_id();
		
        // service 처리후 int값 받아줄 Check 객체 생성
		Check tmp2 = new Check();
		// service 처리후 결과값 Check 객체에 idchenk 변수에 담음
		tmp2.setIdCheck(service.idChk(u_id));
		
		// Check 타입에서 json 타입으로 변환
		ObjectMapper om = new ObjectMapper();
		String jsonString = om.writeValueAsString(tmp2);

		// json 타입 결과갑 리턴
		return jsonString;
	}

	// 닉네임 중복체크 처리
	@RequestMapping(value = "/member/nickChk", method = RequestMethod.POST)
	public int nickChk(@RequestParam("u_nicknmae") String nickname) {

		int res = service.nickChk(nickname);

		return res;
	}

	// 이메일 중복체크 처리
	@RequestMapping(value = "/member/emailChk", method = RequestMethod.POST)
	public int emailChk(@RequestParam("u_email") String email) {

		int res = service.emailChk(email);

		return res;
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String memberLogin(@ModelAttribute MavenMember member, HttpSession session) {
		System.out.println(member.getU_id());
		MavenMember result = service.memberLogin(member);
		if (result != null) {
			System.out.println("로그인 성공");
			session.setAttribute("member", result);
			return "redirect:/index";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/login";
		}
	}

	// 로그아웃 요청 처리 : localhost:8089/aniting/logout
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String memberLogout(HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/index";
	}

	@RequestMapping(value = "/member/update", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MavenMember member, HttpSession session) {
		// id, pw, nickname => 한 회원에 정보 (MavenMember)
		// RequestParam => 파라미터 하나하나 가져오는 방법
		// ModelAttriibute => 특정한 Model 형태로 파라미터를 묶어서 가져오는 방법
		// => 사용한 Model Class : 기본 생성자, Setter 생성
		System.out.println(member.getU_id());
		System.out.println(member.getU_pw());
		System.out.println(member.getU_nickname());

		int res = service.memberUpdate(member);

		System.out.println(res);

		if (res > 0) {
			// 수정 성공
			// member 세션을 수정한 값을 저장하도록 변경(새롭게 생성)
			session.setAttribute("member", member);
			return "redirect:/index";

		} else {
			return "reirect:/update";
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String memberDelete(@RequestParam("u_id") String id, HttpSession session) {
		System.out.println(id);
		int res = service.memberDelete(id);
		if (res > 0) {
			// 성공 - 로그인이 풀리게
			session.removeAttribute("member");
		}
		return "redirect:/index";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String memberList(Model model) {
		List<MavenMember> list = service.memberList();
		// 리스트 저장 -> 세션(서버 용량 차지) => 불필요하게 용량을 많이 차지
		// forwarding (현재 사용하는 request, response를 다음페이지에서도 사용할 수 있도록 해줌)
		// 세션 / request 영역
		// 스프링 에서 데이터를 임시적으로 저장할 때 사용하는 객체
		// request와 같은 역할을 하는 객체(Model)
		// Model : 임시적으로 다음 페이지에서만 사용할 데이터를 넘기고(저장하고)싶을 때
		model.addAttribute("list", list);
		return "list";

		// return "redirect:/list";

	}

//	@RequestMapping(value="/member/addchat", method=RequestMethod.POST)
//	public String chatAdd(@RequestParam("log")String log)
//	{
//		System.out.println(log);
//		return "redirect:/chat";
//	}
}
