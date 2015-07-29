package com.bond.pamela.domain;

import java.util.HashMap;
import java.util.Map;

import org.neo4j.graphdb.Direction;
import org.springframework.data.neo4j.annotation.Fetch;
import org.springframework.data.neo4j.annotation.Indexed;
import org.springframework.data.neo4j.annotation.NodeEntity;
import org.springframework.data.neo4j.annotation.RelatedTo;

@NodeEntity
public class User extends Domain {
	@Indexed(unique = true)
	private String name;
	private String password;
	private String theme;

	@RelatedTo(type = "loves", direction = Direction.OUTGOING)
	@Fetch
	private User lover;

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

	public String getTheme() {
		return this.theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public User getLover() {
		return this.lover;
	}

	public void setLover(User lover) {
		this.lover = lover;
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
		rep.put("theme", this.theme);
		Map<String, Object> lover = new HashMap<>();
		lover.put("id", this.lover.id);
		lover.put("name", this.lover.getName());
		rep.put("lover", lover);
		return rep;
	}

}
