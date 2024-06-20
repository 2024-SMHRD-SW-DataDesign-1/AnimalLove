package com.smhrd.myapp;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.smhrd.myapp.model.Animal;
import com.smhrd.myapp.service.AnimalService;

@Controller
public class AnimalController {

	@Autowired
	AnimalService service;

	@RequestMapping(value = "/animal_info/save", method = RequestMethod.POST)
	public void animalJoin(
			@ModelAttribute Animal animal,
			HttpSession session,
			@RequestPart("photo") List<MultipartFile> file
			)  {
		
		

		
		// 세션에서 저장된 데이터 가져오기
		//System.out.println(file.getOriginalFilename());
		
		//System.out.println(file);
//		Animal savedAnimal = (Animal) session.getAttribute("animal");
		
//		animal.setA_id(savedAnimal.getA_id());
//		animal.setA_id(savedAnimal.getA_id());
//		animal.setA_id(savedAnimal.getA_id());
//		animal.setA_id(savedAnimal.getA_id());
//		animal.setA_id(savedAnimal.getA_id());
		
//		System.out.println(savedAnimal.getA_u_id());
//		System.out.println(savedAnimal.getA_name());
//		System.out.println(savedAnimal.getA_weight());
//		System.out.println(savedAnimal.getA_gender());
//		System.out.println(savedAnimal.getA_breed());
//		
		System.out.println(animal.getA_path1());
		System.out.println(animal.getA_path2());
		System.out.println(animal.getA_path3());

//		String uploadFolder = "../img";
//		// UUID : 랜덤 문자열 생성 (겹치지 않도록)
//				String fileName = UUID.randomUUID().toString() + file.getOriginalFilename();
//				file.transferTo(new File(uploadFolder, fileName));
//				
//				animal.setA_path1(fileName);
//				animal.setA_path2(fileName);
//				animal.setA_path3(fileName);
				
//				int res = service.animalJoin(animal);
//
//				if (res > 0) {
//					return "redirect:/matPrifile";
//				} else {
//					return "redirect:/animalInfo";
//				}

	}
}
