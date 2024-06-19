package com.smhrd.board.converter;

import java.io.File;
import java.io.IOException;
import java.util.Base64;

import org.apache.commons.io.FileUtils;

public class ImageToBase64 {

	// 이미지파일을 base64로 인코딩한 문자열로 변경해주는 메서드
	public String convert(File file) throws IOException {
		byte [] fileContent = FileUtils.readFileToByteArray(file);
		return Base64.getEncoder().encodeToString(fileContent);
	}
}
