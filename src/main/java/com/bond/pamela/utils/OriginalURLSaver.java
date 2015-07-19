package com.bond.pamela.utils;

import java.util.HashMap;
import java.util.Map;

public class OriginalURLSaver {
	private static OriginalURLSaver instance;
	private Map<String, String> container;

	private OriginalURLSaver() {
		container = new HashMap<>();
	}

	public static OriginalURLSaver getInstance() {
		if (instance == null)
			synchronized (OriginalURLSaver.class) {
				if (instance == null)
					instance = new OriginalURLSaver();
			}
		return instance;
	}

	public String getURL(String id) {
		if (container.containsKey(id))
			return container.get(id);
		else
			return "/index.jsp";
	}

	public void setURL(String id, String URL) {
		container.put(id, URL);
	}
}
