package com.smhrd.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.myapp.model.LocationInfo;

@Mapper
public interface LocationInfoMapper {
	
	@Select("select * from 	campus_24SW_DD_p2_3.LOCATION")
	public List<LocationInfo> locationList();

}
