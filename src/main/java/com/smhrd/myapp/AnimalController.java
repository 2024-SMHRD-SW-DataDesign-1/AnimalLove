package com.smhrd.myapp;

import java.io.File;
import java.io.IOException;
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

import com.smhrd.myapp.model.Animal;
import com.smhrd.myapp.service.AnimalService;

@Controller
public class AnimalController {

	@Autowired
	AnimalService service;

	@RequestMapping(value = "/animal_info/save", method = RequestMethod.POST)
	public void AnimalJoin(@ModelAttribute Animal animal, HttpSession session, @RequestPart("photo") MultipartFile file) throws IllegalStateException, IOException {
		// 세션에서 저장된 데이터 가져오기
		Animal savedAnimal = (Animal) session.getAttribute("animal");

		System.out.println(savedAnimal.getA_u_id());
		System.out.println(savedAnimal.getA_name());
		System.out.println(savedAnimal.getA_weight());
		System.out.println(savedAnimal.getA_gender());
		System.out.println(savedAnimal.getA_breed());
		System.out.println(savedAnimal.getA_path1());
		System.out.println(savedAnimal.getA_path2());
		System.out.println(savedAnimal.getA_path3());

//		String uploadFolder = "C://img";
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
