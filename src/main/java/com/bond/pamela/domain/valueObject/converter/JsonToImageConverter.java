package com.bond.pamela.domain.valueObject.converter;

import org.springframework.core.convert.converter.Converter;

import com.bond.pamela.domain.valueObject.Image;
import com.bond.pamela.utils.JsonHelper;

public class JsonToImageConverter implements Converter<String, Image> {

	@Override
	public Image convert(String json) {
		// TODO Auto-generated method stub
		return JsonHelper.fromJson(json, Image.class);
	}

}
