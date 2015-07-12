package com.bond.pamela.domain.factory;

import java.util.Map;

public interface DomainFactory {
	public Object create(Map<String, Object> parameters);
}
