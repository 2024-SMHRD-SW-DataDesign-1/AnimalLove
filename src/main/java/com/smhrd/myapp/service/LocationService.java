package com.smhrd.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.myapp.mapper.LocationInfoMapper;
import com.smhrd.myapp.model.LocationInfo;

@Service
public class LocationService {
	@Autowired
	LocationInfoMapper mapper;

	// 위치정보 처리
	public List<LocationInfo> locationList(){
		return mapper.locationList();		
	}
}