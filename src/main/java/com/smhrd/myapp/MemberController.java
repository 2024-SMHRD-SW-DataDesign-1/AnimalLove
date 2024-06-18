package com.smhrd.myapp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
				return "redirect:/join";
			} else if (emailChkResult == 0 && nickChkResult == 0 && idChkResult == 0) {
				service.memberJoin(member);
				return "redirect:/login";
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/index";

	}

	// 아이디 중복체크 처리
	@ResponseBody
	@RequestMapping(value = "/member/idChk", method = RequestMethod.POST)
	public String idChk(MavenMember member) {

		return service.idChk(member.getU_id()) + "";

	}

	// 닉네임 중복체크 처리
	@ResponseBody
	@RequestMapping(value = "/member/nickChk", method = RequestMethod.POST)
	public String nickChk(MavenMember member) {

		return service.nickChk(member.getU_nickname()) + "";

	}

	// 이메일 중복체크 처리
	@ResponseBody
	@RequestMapping(value = "/member/emailChk", method = RequestMethod.POST)
	public String emailChk(MavenMember member) {
		return service.emailChk(member.getU_email()) + "";
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String memberLogin(@ModelAttribute MavenMember member, HttpSession session) {
		System.out.println(member.getU_id());
		MavenMember result = service.memberLogin(member);
		if (result != null) {
			System.out.println("로그인 성공");
			session.setAttribute("member", result);
			return "redirect:/";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/login";
		}
	}

	// 업데이트 요청 처리 : localhost:8089/aniting/update
	@RequestMapping(value = "/member/update", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MavenMember member, HttpServletRequest request) {

		// 세션 가져오기
		HttpSession session = request.getSession();

		// 세션에서 값 가져오기 --> 로그인 당시 정보
		MavenMember member2 = (MavenMember) session.getAttribute("member");
		int nickChkResult = service.nickChk(member.getU_nickname());
		int emailChkResult = service.emailChk(member.getU_email());
		System.out.println(member.getU_email());
		System.out.println(member2.getU_email());
		try {
			// (성공)
			if ((emailChkResult == 0 || member.getU_email().equals(member2.getU_email()))
					&& (nickChkResult == 0 || member.getU_nickname().equals(member2.getU_nickname()))) {
				service.memberUpdate(member);
				return "redirect:/login";
			} // (실패)
			else if (emailChkResult == 1 || nickChkResult == 1) {
				return "redirect:/update";
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/index";
	}

	// 로그아웃 요청 처리 : localhost:8089/aniting/logout
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String memberLogout(HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/";
	}

	// 탈퇴 처리
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
