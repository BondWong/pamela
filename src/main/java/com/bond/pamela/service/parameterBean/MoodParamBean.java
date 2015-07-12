package com.bond.pamela.service.parameterBean;

import java.util.List;

import javax.ws.rs.QueryParam;

public class MoodParamBean {
	@QueryParam("moods")
	List<String> moods;

	public List<String> getMoods() {
		return this.moods;
	}
}
