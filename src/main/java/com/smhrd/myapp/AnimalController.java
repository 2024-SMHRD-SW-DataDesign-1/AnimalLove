package com.smhrd.myapp;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.board.converter.ImageToBase64;
import com.smhrd.myapp.model.Animal;
import com.smhrd.myapp.model.MavenMember;
import com.smhrd.myapp.service.AnimalService;

@Controller
public class AnimalController {

	@Autowired
	AnimalService service;

	@Autowired
	ResourceLoader resourceLoader;

	@RequestMapping(value = "/animal_info/save", method = RequestMethod.POST)
	public String animalJoin(@ModelAttribute Animal animal, HttpSession session,
			@RequestPart("photo") List<MultipartFile> file) throws IOException {

		// 페이지1에서 받은 정보 animal 에 취합
		Animal tem = (Animal) session.getAttribute("animal");
		animal.setA_u_id(tem.getA_u_id());
		animal.setA_name(tem.getA_name());
		animal.setA_age(tem.getA_age());
		animal.setA_weight(tem.getA_weight());
		animal.setA_gender(tem.getA_gender());
		animal.setA_breed(tem.getA_breed());
		animal.setA_intro(tem.getA_intro());
		
		if(tem.getA_age()<4) {
			animal.setA_filterage("1~3");
		}else if (tem.getA_age()<7) {
			animal.setA_filterage("4~6");
		}else if (tem.getA_age()<10) {
			animal.setA_filterage("7~9");
		}else {
			animal.setA_filterage("10~");
		}
		
		if(tem.getA_weight()<11) {
			animal.setA_filterweight("~10");
		}else if (tem.getA_weight()<21) {
			animal.setA_filterweight("11~20");
		}else {
			animal.setA_filterweight("21~");
		}
		
		
		
		// 파일 경로 설정
		String path1 = session.getServletContext().getRealPath("resources/img/animalImg/");
		String path = "C:\\Users\\smhrd\\git\\AnimalLove\\src\\main\\webapp\\resources\\img\\animalImg\\";
		
		System.out.println(path1);
		for (int i = 0; i < file.size(); i++) {
			// 파일 이름설정
			String fileName = UUID.randomUUID().toString() + file.get(i).getOriginalFilename();
			try {
				// uploadFolder 파일 업로드
				file.get(i).transferTo(new File(path, fileName));
				switch(i)
				{
				case 0:
					animal.setA_path1(path+fileName);
					break;
				case 1:
					animal.setA_path2(path+fileName);
					break;
				case 2:
					animal.setA_path3(path+fileName);
					break;
				}
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		};
		
		int res = service.animalJoin(animal);
		
		if(res>0) {
			return "redirect:/prfInfo";
		}else {
			return "redirect:/matching";
		}
	}
	
	// 동물정보 출력
	@RequestMapping(value = "/animalte", method = RequestMethod.POST)
	public String animalRoad(String a_u_id, HttpSession session, Model model) throws IOException {
		
		Animal animal = service.animalRoad(a_u_id);
		
		
		
		File imgFile = new File(animal.getA_path1());
		
		ImageToBase64 converter=new ImageToBase64();
		String imgBase64String = converter.convert(imgFile);
		
		//System.out.println(imgBase64String);
		animal.setA_path1(imgBase64String);
		model.addAttribute("animal", animal);
		
		return "animaltest";
	}
	
	// 동물정보저장
	@RequestMapping(value = "/prfinforsave", method = RequestMethod.POST)
	public String animalPrefer(@ModelAttribute Animal animal) {
		int res = service.animalPrefer(animal);
		
		
		if(res>0) {
			return "page/matProfile";
		}else {
			return "page/prfinfo";
		}
	}
	
	// 매칭해줄 프로필 3개 선택
	@RequestMapping(value = "#", method = RequestMethod.POST)
	public String matching(HttpServletRequest request, Model model) throws IOException {
		HttpSession session = request.getSession();
		MavenMember member = (MavenMember) session.getAttribute("member");
		List<Animal> result = service.matching(member.getU_id());
		
		
		
		
		
		return "";
	}
	
}
