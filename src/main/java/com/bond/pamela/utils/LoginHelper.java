package com.bond.pamela.utils;

import java.util.HashMap;
import java.util.Map;

public class LoginHelper {
	private static Map<String, Long> userIDs = new HashMap<>();

	public static synchronized void addID(String sessionID, Long ID) {
		userIDs.put(sessionID, ID);
	}

	public static synchronized void removeID(String sessionID) {
		userIDs.remove(sessionID);
	}

	public static boolean contains(String sessionID) {
		return userIDs.containsKey(sessionID) && userIDs.get(sessionID) != null;
	}

	public static Long getID(String sessionID) {
		return userIDs.get(sessionID);
	}

	// for JSP page
	public static String getIDStr(String sessionID) {
		return userIDs.get(sessionID) + "";
	}

}
