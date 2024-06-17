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
public class Log {
	private String cl_c_id;
	private String cl_senid;
	private String cl_log;
	private Timestamp cl_sentime;
	private int cl_ruread;

	public Log(String cl_c_id, String cl_senid, String cl_log) {
		this.cl_c_id = cl_c_id;
		this.cl_senid = cl_senid;
		this.cl_log = cl_log;
	}
	
}

