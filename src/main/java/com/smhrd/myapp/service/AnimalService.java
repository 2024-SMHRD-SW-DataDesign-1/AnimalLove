package com.smhrd.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.myapp.mapper.AnimalMapper;
import com.smhrd.myapp.model.Animal;

@Service
public class AnimalService {
	
	@Autowired // 의존성 주입
	AnimalMapper mapper;

	// 동물등록 처리
	public int AnimalJoin(Animal animal) {
		return mapper.AnimalJoin(animal);
	}
}
