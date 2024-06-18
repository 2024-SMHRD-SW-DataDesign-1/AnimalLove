package com.smhrd.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.myapp.model.Animal;
import com.smhrd.myapp.service.ChatService;

@Controller
public class AnimalController {
	
	@Autowired
	ChatService service;	
	
	@RequestMapping(value="/anmalinfo/save", method=RequestMethod.POST)
	public String addInfo(Animal animal)
	{
		// 세션에서 데이터 받아오신후 합치는 작업 필요함
		return "page/animalInfo2";
	}
}
