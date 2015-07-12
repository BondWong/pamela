package com.bond.pamela.domain;

import java.util.HashMap;
import java.util.Map;

import org.springframework.data.neo4j.annotation.Indexed;
import org.springframework.data.neo4j.annotation.NodeEntity;

@NodeEntity
public class User extends Domain {
	@Indexed(unique = true)
	private String name;
	private String password;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public boolean equals(Object object) {
		if (this == object)
			return true;
		if (this.id == null)
			return false;
		if (!(object instanceof User))
			return false;
		return this.id.equals(((User) object).getId());
	}

	public int hashCode() {
		return this.id.hashCode();
	}

	@Override
	public Map<String, Object> toRep() {
		// TODO Auto-generated method stub
		Map<String, Object> rep = new HashMap<>();
		rep.put("id", this.id);
		rep.put("name", this.name);
		rep.put("password", this.password);
		return rep;
	}

}
