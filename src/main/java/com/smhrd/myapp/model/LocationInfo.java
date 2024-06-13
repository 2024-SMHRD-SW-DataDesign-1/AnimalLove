package com.smhrd.myapp.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@NoArgsConstructor
@AllArgsConstructor
@Getter

public class LocationInfo {
	// 위치 정보 관련
	private String l_name;
	private double l_latitude;
	private double l_longitude;

}
