package com.smhrd.myapp.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.smhrd.myapp.model.Animal;
@Mapper
public interface AnimalMapper {
	
	// 동물등록 처리
	@Insert("INSERT INTO ANIMAL VALUES (#{a_name}, #{a_age}, #{a_weight}), #{a_gender}, #{a_breed}")
	public int animalJoin(Animal animal);
	
	// 동물정보수정 처리
	@Update("UPDATE ANIMAL SET a_name=#{a_name}, a_age=#{a_age}, a_weight=#{a_weight}, a_gender=#{a_gender}, a_breed=#{a_breed}")
	public int animalUpdate(Animal animal);
	
	 
}
