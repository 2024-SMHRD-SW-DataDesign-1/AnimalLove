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
	public int animalJoin(Animal animal) {
		return mapper.animalJoin(animal);
	}
	// 동물정보수정 처리
	public int animalUpdate(Animal animal) {
		return mapper.animalUpdate(animal);
	}
	
	// 동물 선호도등록 처리
	public int animalPrefer(Animal animal) {
		return mapper.animalPrefer(animal);
	}
	
	//동물 선호도수정 처리
	public int animalPreup(Animal animal) {
		return mapper.animalPreup(animal);
	}
	
}

