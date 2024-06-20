package com.smhrd.myapp;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
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

	@Autowired
	ResourceLoader resourceLoader;

	@RequestMapping(value = "/animal_info/save", method = RequestMethod.POST)
	public void animalJoin(@ModelAttribute Animal animal, HttpSession session,
			@RequestPart("photo") List<MultipartFile> file) throws IOException {

		// 세션에서 저장된 데이터 가져오기
		// System.out.println(file.getOriginalFilename());

		// System.out.println(file);
		

		// 다운 위치 지정
		String path = session.getServletContext().getRealPath("resources/img/animalImg/");

	
		String uploadFolder = path;

		for (int i = 0; i < file.size(); i++) {
			// 중복파이명 감지를 위해 고유문자를 삽입하는 코드
			String fileName = UUID.randomUUID().toString() + file.get(i).getOriginalFilename();
			try {
				// uploadFolder 경로에 이미지 복사
				file.get(i).transferTo(new File(uploadFolder, fileName));
				switch(i)
				{
				case 0:
					animal.setA_path1(uploadFolder+path);
					break;
				case 1:
					animal.setA_path2(uploadFolder+path);
					break;
				case 2:
					animal.setA_path3(uploadFolder+path);
					break;
				}
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		};
		

	}
}
