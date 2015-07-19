package com.bond.pamela.utils;

import java.util.HashMap;
import java.util.Map;

public class AutoLoginHelper {
	private static Map<String, String> ppal = new HashMap<>();

	public static void put(String sessionID, String userID) {
		ppal.put(sessionID, userID);
	}

	public static String autoLogin(String sessionID) {
		return ppal.get(sessionID);
	}

}
