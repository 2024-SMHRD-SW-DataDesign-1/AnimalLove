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
import com.smhrd.myapp.model.MavenMember;
import com.smhrd.myapp.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	// 회원가입 요청 처리
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
		return "redirect:/";

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

	// 로그인 요청 처리
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

	// 업데이트 요청 처리
	@RequestMapping(value = "/member/update", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MavenMember member, HttpServletRequest request) {
		
		// 세션 가져오기
		HttpSession session = request.getSession();

		// 세션에서 값 가져오기 --> 로그인 당시 정보
		MavenMember member2 = (MavenMember) session.getAttribute("member");
		int nickChkResult = service.nickChk(member.getU_nickname());
		int emailChkResult = service.emailChk(member.getU_email());
		try {
			// (성공)
			if ((emailChkResult == 0 || member.getU_email().equals(member2.getU_email()))
					&& (nickChkResult == 0 || member.getU_nickname().equals(member2.getU_nickname()))) {
				service.memberUpdate(member);
				
				MavenMember result = service.memberLogin(member);
				session.setAttribute("member", result);
				
				return "redirect:/";
			} // (실패)
			else if (emailChkResult == 1 || nickChkResult == 1) {
				return "redirect:/update";
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}

	// 로그아웃 요청 처리 : localhost:8089/aniting/logout
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String memberLogout(HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/";
	}
}
