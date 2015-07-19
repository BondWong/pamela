package com.bond.pamela.utils;

public class InitializationIndicator {
	private static InitializationIndicator instance = null;
	private boolean created = false;

	private InitializationIndicator() {

	}

	public static InitializationIndicator getInstance() {
		if (instance == null)
			synchronized (InitializationIndicator.class) {
				if (instance == null)
					instance = new InitializationIndicator();
			}
		return instance;
	}

	public void setCreated(boolean created) {
		this.created = created;
	}

	public boolean isCreated() {
		return this.created;
	}

}
