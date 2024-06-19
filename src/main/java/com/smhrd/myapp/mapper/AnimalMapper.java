package com.smhrd.myapp.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.smhrd.myapp.model.Animal;
@Mapper
public interface AnimalMapper {
	
	// 동물등록 처리
	@Insert("INSERT INTO ANIMAL VALUES ()  ")
	public int AnimalJoin(Animal animal);
}
