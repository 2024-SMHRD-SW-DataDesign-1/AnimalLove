package com.smhrd.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.myapp.model.Animal;
@Mapper
public interface AnimalMapper {
	
	// 동물등록 처리
	@Insert("INSERT INTO ANIMAL (a_u_id,a_name,a_breed,a_gender,a_age,a_weight,a_intro,a_path1,a_path2,a_path3,a_filterage,a_filterweight) VALUES (#{a_u_id}, #{a_name}, #{a_breed}, #{a_gender}, #{a_age}, #{a_weight}, #{a_intro}, #{a_path1}, #{a_path2}, #{a_path3}, #{a_filterage}, #{a_filterweight})")
	public int animalJoin(Animal animal);
	
	// 동물정보수정 처리
	@Update("UPDATE ANIMAL SET a_name=#{a_name}, a_breed=#{a_breed}, a_gender=#{a_gender}, a_age=#{a_age}, a_weight=#{a_weight}, a_intro=#{a_intro}, a_path1=#{a_path1}, a_path2=#{a_path2}, a_path3=#{a_path3},a_filterage=#{a_filterage}, a_filterweight=#{a_filterweight}")
	public int animalUpdate(Animal animal);
	
	// 동물 선호도등록 처리
	@Insert("UPDATE ANIMAL SET a_prfbreed=#{a_prfbreed}, a_prfage=#{a_prfage}, a_prfweight=#{a_prfweight} WHERE a_u_id=#{a_u_id}")
	public int animalPrefer(Animal animal);
	
	// 동물 선호도수정 처리
	@Update("UPDATE ANIMAL SET a_prfBreed=#{a_prfbreed}, a_prfage=#{a_prfage}, a_prfweight=#{a_prfweight}")
	public int animalPreup(Animal animal);
	
	// 동물 프로필 가져오기
	@Select("select * from ANIMAL where a_u_id=#{a_u_id}")
	public Animal animalRoad(String a_u_id);
	
	@Select("select a_prfbreed,a_prfage,a_prfweight from ANIMAL where a_u_id=#{a_u_id}")
	public Animal prfload(String a_u_id);
	
	// 매칭
	@Select("select * from ANIMAL where a_breed=#{a_prfbreed} and a_filterage=#{a_prfage} and a_filterweight = #{a_prfweight} ORDER BY RAND() LIMIT 3")
	public List<Animal> matching(Animal animal);
}
