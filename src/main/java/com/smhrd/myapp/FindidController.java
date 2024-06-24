package com.smhrd.myapp;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.myapp.model.MavenMember;
import com.smhrd.myapp.service.FindidService;

@Controller
public class FindidController {

	@Autowired
	FindidService service;
	
//	@RequestMapping(value="/findid", method=RequestMethod.GET)
//	public String findid() {
//		return "findid";
//	}
	
	@RequestMapping(value="/finddbid", method=RequestMethod.GET)
	public String recieveid(@RequestParam("code") String code,HttpSession session) {
		
//    String code = request.getParameter("code");
//    avenMemberDAO dao = new MavenMemberDAO();
//    String id = dao.getId(code);
//    response.sendRedirect("index.jsp?id=" + id);
		session.setAttribute("id",service.getid(code));
		return "redirect:/";
		
	}
	
	// id 찾기는 일반으로 111**@ㅁㅁㅁ
	// id 보다는 비밀번호 찾기에 쓰고
	// 사용자가 url 클릭시 비밀번호를 수정하는 페이지로 이동시키기
	// 사용자가 비밀번호 찾기 눌렀을 때, cookie 형식으로 랜덤 문자열을 주면된다 $12314@$!@$!%!#%!!
	@RequestMapping(value="/findidcon", method=RequestMethod.POST)
	public String findid(@ModelAttribute MavenMember member, HttpSession session) {
		int res = service.findid(member);
		System.out.println(res);

		if (res == 1) {
			String host = "http://localhost:8089/aniting/finddbid";
			String from = "worhks0413@gmail.com";
			String to = member.getU_email();
			String subject = "아이디 찾기를 위한 이메일 확인 메일입니다. ";
			String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." + "<a href='" + host + "?code="
					+to + "&token=" +"'>이메일 인증하기</a>";

			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "587");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.ssl.protocols", "TLSv1.2");
			p.put("mail.smtp.debug", "true");

			final String username = "worhks0413@gmail.com";
            final String password = "wosf tshq fhma jaof";
			
			try {
				Authenticator auth = new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                };
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject);
				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(content, "text/html;charset=UTF-8");
				Transport.send(msg);
				session.setAttribute("message", "success");
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("message", "fail");
			}
		}else {
			session.setAttribute("message", "fail");
		}
		return "redirect:/findid";
	}
		
	
	
	
	
}
