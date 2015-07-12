package com.bond.pamela.domain;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.neo4j.graphdb.Direction;
import org.springframework.data.neo4j.annotation.NodeEntity;
import org.springframework.data.neo4j.annotation.RelatedTo;

import com.bond.pamela.domain.valueObject.Image;

@NodeEntity
public class Diary extends Domain {
	private String title;
	private Date date;
	private String weather;
	private String mood;
	private String htmlContent;

	private List<Image> images = new ArrayList<>();

	@RelatedTo(type = "writtenBy", direction = Direction.OUTGOING)
	private User author;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getMood() {
		return mood;
	}

	public void setMood(String mood) {
		this.mood = mood;
	}

	public String getHtmlContent() {
		return htmlContent;
	}

	public void setHtmlContent(String htmlContent) {
		this.htmlContent = htmlContent;
	}

	public void addImage(Image image) {
		this.images.add(image);
	}

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public void clearImages() {
		this.images.clear();
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	@Override
	public boolean equals(Object object) {
		if (this == object)
			return true;
		if (this.id == null)
			return false;
		if (!(object instanceof Diary))
			return false;
		return this.id.equals(((Diary) object).getId());
	}

	public int hashCode() {
		return this.id.hashCode();
	}

	@Override
	public Map<String, Object> toRep() {
		// TODO Auto-generated method stub
		Map<String, Object> rep = new HashMap<>();
		rep.put("id", this.id);
		rep.put("title", this.title);
		rep.put("date", new SimpleDateFormat("yyyy-MM-dd").format(this.date));
		rep.put("weather", this.weather);
		rep.put("mood", this.mood);
		rep.put("htmlContent", this.htmlContent);

		List<Map<String, Object>> imageReps = new ArrayList<>();
		for (Image image : this.images) {
			Map<String, Object> imageRep = new HashMap<>();
			imageRep.put("width", image.getWidth());
			imageRep.put("height", image.getHeight());
			imageRep.put("link", image.getLink());
			imageReps.add(imageRep);
		}

		rep.put("images", imageReps);

		return rep;
	}
}
