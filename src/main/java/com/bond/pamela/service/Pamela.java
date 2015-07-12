package com.bond.pamela.service;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

import org.glassfish.jersey.jackson.JacksonFeature;
import org.glassfish.jersey.media.multipart.MultiPartFeature;

@ApplicationPath("/pamela")
public class Pamela extends Application {
	public Set<Class<?>> getClasses() {
		Set<Class<?>> classes = new LinkedHashSet<Class<?>>();
		classes.add(DiaryService.class);
		classes.add(MoodService.class);
		classes.add(ImageService.class);
		classes.add(JacksonFeature.class);
		classes.add(MultiPartFeature.class);

		return classes;
	}

	public Set<Object> getSingletons() {
		Set<Object> singletons = new LinkedHashSet<Object>();

		return singletons;
	}
}
