package com.bond.pamela.domain.valueObject.converter;

import org.springframework.core.convert.converter.Converter;

import com.bond.pamela.domain.valueObject.Image;
import com.bond.pamela.utils.JsonHelper;

public class ImageToJsonConverter implements Converter<Image, String> {

	@Override
	public String convert(Image image) {
		// TODO Auto-generated method stub
		return JsonHelper.toJson(image);
	}

}
