package com.bond.pamela.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bond.pamela.persistence.DirayRepository;
import com.bond.pamela.persistence.result.ThumbnailResult;

@Component
@Path("/image")
public class ImageService {
	@Autowired
	GraphDatabaseService db;
	@Autowired
	DirayRepository repository;

	@Path("/all")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response fetchAllImages() {
		try (Transaction tx = db.beginTx()) {
			ThumbnailResult result = repository.fetchAllImages();
			List<String> thumbnailLinks = new ArrayList<>();
			Pattern pattern = Pattern
					.compile("\"link\":\"(thumbnail-.{1,30}-\\d{4}-\\d{2}-\\d{2}\\-[a-zA-Z]{1,10}-\\d{1,}.\\w{2,4})\"");
			for (String imageRep : result.getThumbnails()) {
				Matcher matcher = pattern.matcher(imageRep);
				while (matcher.find()) {
					thumbnailLinks.add(matcher.group(1));
				}
			}
			return Response.ok(new GenericEntity<List<String>>(thumbnailLinks) {
			}).build();
		}
	}

	@Path("/count")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response count() {
		try (Transaction tx = db.beginTx()) {
			Long count = repository.countImages();
			return Response.ok(count).build();
		}
	}

}
