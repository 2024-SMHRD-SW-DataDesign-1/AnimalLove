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

	@RequestMapping(value = "/animal_info/save", method = RequestMethod.POST)
	public void AnimalJoin(@ModelAttribute Animal animal, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		// 세션에서 저장된 데이터 가져오기
		Animal savedAnimal = (Animal) session.getAttribute("animal");

		// 세션에서 받아온 데이터로 Animal 객체 설정
		System.out.println(savedAnimal.getA_u_id());
		System.out.println(savedAnimal.getA_name());
		System.out.println(savedAnimal.getA_weight());
		System.out.println(savedAnimal.getA_gender());
		System.out.println(savedAnimal.getA_breed());
		System.out.println(savedAnimal.getA_path1());
		System.out.println(savedAnimal.getA_path2());
		System.out.println(savedAnimal.getA_path3());

//		 // 파일 처리
//        try {
//            if (!file1.isEmpty()) {
//                byte[] bytes = file1.getBytes();
//                // 파일 저장 로직 추가
//                animal.setA_path1(file1.getOriginalFilename()); // 예시로 파일 이름 저장
//            }
//            if (!file2.isEmpty()) {
//                byte[] bytes = file2.getBytes();
//                // 파일 저장 로직 추가
//                animal.setA_path2(file2.getOriginalFilename()); // 예시로 파일 이름 저장
//            }
//            if (!file3.isEmpty()) {
//                byte[] bytes = file3.getBytes();
//                // 파일 저장 로직 추가
//                animal.setA_path3(file3.getOriginalFilename()); // 예시로 파일 이름 저장
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        // 디버깅을 위한 출력
//        System.out.println("a_path1: " + animal.getA_path1());
//        System.out.println("a_path2: " + animal.getA_path2());
//        System.out.println("a_path3: " + animal.getA_path3());
//
//        // AnimalService를 통해 데이터베이스에 저장
//        int res = service.animalJoin(animal);
//        System.out.println("Database insertion result: " + res);
//
//        // 저장 결과에 따라 리다이렉션 결정
//        if (res > 0) { // 성공적으로 저장된 경우
//            return "redirect:/"; // 홈 페이지로 리다이렉트
//        } else { // 저장 실패 시
//            return "redirect:/matching_pic"; // 다른 페이지로 리다이렉트
//        }
	}
}
