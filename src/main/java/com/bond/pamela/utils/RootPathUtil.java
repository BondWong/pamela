package com.bond.pamela.utils;

public class RootPathUtil {
	public static RootPathUtil instance;
	private String root;

	private RootPathUtil(String root) {
		this.root = root;
	}

	public static RootPathUtil init(String root) {
		if (instance == null) {
			synchronized (RootPathUtil.class) {
				if (instance == null) {
					instance = new RootPathUtil(root);
				}
			}
		}
		return instance;
	}

	public String getRoot() {
		return root;
	}
}
