package com.bond.pamela.domain;

import java.util.Map;

import org.springframework.data.neo4j.annotation.GraphId;

public abstract class Domain {
	@GraphId
	protected Long id;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public abstract Map<String, Object> toRep();

}
