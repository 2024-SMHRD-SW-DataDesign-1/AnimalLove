package com.smhrd.myapp.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.myapp.mapper.AnimalMapper;
import com.smhrd.myapp.model.Animal;
import com.smhrd.myapp.model.Likelist;
import com.smhrd.myapp.model.MavenMember;

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
	
	// 좋아요리스트 조회
	public Likelist likelistinquiry(Likelist likelist) {
		return mapper.likelistinquiry(likelist);
	}
	
	// 좋아요리스트 등록
	public int likelistinsert(Likelist likelist) {
		return mapper.likelistinsert(likelist);
	}
	
	// 좋아요 리스트 삭제 
	public int likelistdelete(Likelist likelist) {
		return mapper.likelistdelete(likelist);
	}
	
	// 유저에 저장되있는 a_mid1,2,3 불러오기
	public MavenMember matchingsave(String u_id) {
		return mapper.matchingsave(u_id);
	}
	
	// 저장됬던 3명의 프로필 가져오기
	public List<Animal> savedmatching(MavenMember save){
		return mapper.savedmatching(save);
	}
	
	// 유저에 매칭됬던 사용자 아이디,시간 저장하기
	public void midsave(MavenMember mid) {
		mapper.midsave(mid);
	}
	
	// 유저에 저장되있는 시간 가져오기
	public Timestamp mtimeload(String u_id) {
		return mapper.mtimeload(u_id);
	}
	
	// 유저에 mid,time 삭제
	public void matreset(String u_id) {
		mapper.matreset(u_id);
	}
}

