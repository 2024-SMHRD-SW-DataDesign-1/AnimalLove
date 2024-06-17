package com.smhrd.myapp.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class Chat {

	private int c_id;
	private String c_senid;
	private String c_recid;
	private int c_accept; 
}
