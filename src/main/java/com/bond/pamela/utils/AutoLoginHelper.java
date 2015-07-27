package com.bond.pamela.utils;

import java.io.IOException;
import java.lang.reflect.Type;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.reflect.TypeToken;

public class AutoLoginHelper {
	private final static String PATH = "autoLoginDB.txt";
	private final static Type type = new TypeToken<Map<String, Long>>() {
	}.getType();
	private static Map<String, Long> ppal;

	public static void put(String sessionID, Long userID) {
		ppal.put(sessionID, userID);
	}

	public static Long get(String sessionID) {
		return ppal.get(sessionID);
	}

	public static void initializeEnvironment() throws IOException {
		if (!Files.exists(Paths.get(PATH))) {
			Files.createFile(Paths.get(PATH));
		}
	}

	public static synchronized void serialize() throws IOException {
		try {
			if (!Files.exists(Paths.get(PATH))) {
				Files.createFile(Paths.get(PATH));
			}
			Files.write(Paths.get(PATH), JsonHelper.toJson(ppal, type)
					.getBytes());
			ppal.clear();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}

	public static synchronized void deserialize() throws IOException {
		byte[] bytes;
		try {
			bytes = Files.readAllBytes(Paths.get(PATH));
			String strSearchMap = new String(bytes, "utf8");
			ppal = JsonHelper.fromJson(strSearchMap, type);
			if (ppal == null)
				ppal = new HashMap<>();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}

}
