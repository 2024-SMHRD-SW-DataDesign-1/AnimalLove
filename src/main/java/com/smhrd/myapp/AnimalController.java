package com.smhrd.myapp;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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

		// 세션에서 저장된 데이터 가져오기
		Animal tem = (Animal) session.getAttribute("animal");
		animal.setA_u_id(tem.getA_u_id());
		animal.setA_name(tem.getA_name());
		animal.setA_weight(tem.getA_weight());
		animal.setA_gender(tem.getA_gender());
		animal.setA_breed(tem.getA_breed());
		animal.setA_intro(tem.getA_intro());
		
		// 다운 위치 지정
		String path = session.getServletContext().getRealPath("resources/img/animalImg/");

		for (int i = 0; i < file.size(); i++) {
			// 중복파이명 감지를 위해 고유문자를 삽입하는 코드
			String fileName = UUID.randomUUID().toString() + file.get(i).getOriginalFilename();
			try {
				// uploadFolder 경로에 이미지 복사
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
	
	// 동물정보 가져오기
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
	
	
}
