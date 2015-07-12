package com.bond.pamela.domain.valueObject;

public final class Image {
	private int width;
	private int height;
	private String link;
	private String name;

	public Image(int width, int height, String link, String name) {
		this.width = width;
		this.height = height;
		this.link = link;
		this.name = name;
	}

	public int getWidth() {
		return this.width;
	}

	public int getHeight() {
		return this.height;
	}

	public String getLink() {
		return this.link;
	}

	public String getName() {
		return this.name;
	}

	public boolean equals(Object object) {
		if (this == object)
			return true;
		if (!(object instanceof Image))
			return false;
		return this.link.equals(((Image) object).getLink())
				&& this.width == ((Image) object).getWidth()
				&& this.height == ((Image) object).getHeight();
	}

	public int hashCode() {
		return this.width + this.height + this.link.hashCode();
	}

}
