package com.smhrd.myapp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.myapp.model.Animal;
import com.smhrd.myapp.service.AnimalService;

@Controller
public class AnimalController {

	@Autowired
	AnimalService service;

	@RequestMapping(value = "/animal_Info/save", method = RequestMethod.POST)
	public String AnimalJoin(@ModelAttribute Animal animal, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// 세션에서 저장된 데이터 가져오기
		Animal savedAnimal = (Animal) session.getAttribute("animal");
	
		// 세션에서 받아온 데이터로 Animal 객체 설정
		animal.setA_u_id(savedAnimal.getA_u_id());
		animal.setA_name(savedAnimal.getA_name());
		animal.setA_weight(savedAnimal.getA_weight());
		animal.setA_gender(savedAnimal.getA_gender());
		animal.setA_breed(savedAnimal.getA_breed());
		
		System.out.println(savedAnimal.getA_u_id());
		System.out.println(savedAnimal.getA_name());
		System.out.println(savedAnimal.getA_weight());
		System.out.println(savedAnimal.getA_gender());
		System.out.println(savedAnimal.getA_breed());
		
		// AnimalService를 통해 데이터베이스에 저장
		int res = service.animalJoin(animal);
		System.out.println(res);

		// 포워딩
		if (res > 0) { // 성공
			return "redirect:/";
		} else { // 실패
			return "redirect:/matching_pic";
		}
	}
}
