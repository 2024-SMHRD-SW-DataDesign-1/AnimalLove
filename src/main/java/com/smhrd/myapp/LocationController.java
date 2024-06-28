package com.smhrd.myapp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.myapp.mapper.LocationInfoMapper;
import com.smhrd.myapp.model.LocationInfo;
import com.smhrd.myapp.service.LocationService;

@Controller
public class LocationController {

	@Autowired
	LocationService service;
	
	@RequestMapping(value="/data/location", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public @ResponseBody String locationList() throws JsonProcessingException {
		List<LocationInfo> list = service.locationList();
		// ** 게시물 정보를 가지고 있는 list 데이터를 응답 (xml, json** {key:value)
		// JAVA 객체 -> JSON 형태의 문자열로 변환 => Jackson 라이브러리
		ObjectMapper om = new ObjectMapper();
		String jsonString = om.writeValueAsString(list);

		return jsonString;
	}

}