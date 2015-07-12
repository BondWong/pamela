package com.bond.pamela.domain.factory;

import java.util.Map;

import com.bond.pamela.domain.User;

public class UserFactory implements DomainFactory {

	private UserFactory() {

	}

	public static UserFactory getInstance() {
		return new UserFactory();
	}

	@Override
	public Object create(Map<String, Object> parameters) {
		// TODO Auto-generated method stub
		User user = new User();
		String name = (String) parameters.get("name");
		String password = (String) parameters.get("password");
		user.setName(name);
		user.setPassword(password);
		return user;
	}

}
