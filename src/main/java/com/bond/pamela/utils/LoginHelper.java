package com.bond.pamela.utils;

import java.util.HashMap;
import java.util.Map;

public class LoginHelper {
	private static Map<String, String> userIDs = new HashMap<>();

	public static synchronized void addID(String sessionID, String ID) {
		userIDs.put(sessionID, ID);
	}

	public static synchronized void removeID(String sessionID) {
		userIDs.remove(sessionID);
	}

	public static boolean contains(String sessionID) {
		return userIDs.containsKey(sessionID) && userIDs.get(sessionID) != null;
	}

	public static String getID(String sessionID) {
		return userIDs.get(sessionID);
	}
}
