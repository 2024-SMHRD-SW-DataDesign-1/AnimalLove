package com.smhrd.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.myapp.model.Animal;
import com.smhrd.myapp.model.MavenMember;
import com.smhrd.myapp.service.AnimalService;
import com.smhrd.myapp.service.ChatService;

@Controller
public class AnimalController {

	@Autowired
	AnimalService service;

	@RequestMapping(value = "/animal_Info/save", method = RequestMethod.POST)
	public String AnimalJoin(@ModelAttribute Animal animal) {

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
