package com.smhrd.myapp.service;

import java.util.List;

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
	
	// 동물 정보 가져오기
	public Animal animalRoad(String a_u_id) {
		return mapper.animalRoad(a_u_id);
	}
	
	// 입력된 동물정보 있는지 조회
	public int selectanimal(String a_u_id) {
		Animal animal = mapper.animalRoad(a_u_id);
		if(animal == null) {
			return 0;
		}else {
			return 1;
		}
	}
	
	// 입력된 선호도 있는지 조회
	public int prfSelect(String a_u_id) {
		Animal animal = mapper.prfload(a_u_id);
		System.out.println(animal);
		if(animal == null) {
			return 0;
		}else {
			return 1;
		}
	}
	
	// 내 동물 정보 가져오기
	public Animal animalinfo(String a_u_id) {
		return mapper.animalRoad(a_u_id);
	}
	
	// 선호도에 따라서 3마리 동물 정보 가져오기 
	public List<Animal> matching(String a_u_id){
		Animal animal = animalinfo(a_u_id);
		return mapper.matching(animal);
	}
}

