package com.bond.pamela.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.BeanParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import jersey.repackaged.com.google.common.collect.Lists;

import org.neo4j.cypher.javacompat.ExecutionEngine;
import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.ResourceIterator;
import org.neo4j.graphdb.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bond.pamela.persistence.DirayRepository;
import com.bond.pamela.persistence.result.Moods;
import com.bond.pamela.service.parameterBean.MoodParamBean;
import com.bond.pamela.utils.JsonHelper;

@Component
@Path("/mood")
public class MoodService {
	@Autowired
	GraphDatabaseService db;
	@Autowired
	DirayRepository repository;

	@Path("/all/{userID: \\d{1,}}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response fetchAllMoods(@PathParam("userID") Long id) {
		try (Transaction tx = db.beginTx()) {
			Moods moods = repository.fetchAllMoods(id);
			Iterable<String> results = moods.getMoods();
			List<String> resultsList = Lists.newArrayList(results);
			return Response.ok(new GenericEntity<List<String>>(resultsList) {
			}).build();
		}
	}

	@Path("/latest/{userID: \\d{1,}}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getLatestMood(@PathParam("userID") Long id) {
		try (Transaction tx = db.beginTx()) {
			String mood = repository.getLatestMood(id);
			return Response.ok(JsonHelper.toJson(mood)).build();
		}
	}

	@Path("/statistic/{userID: \\d{1,}}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response fetchMoodStatistic(@BeanParam MoodParamBean moodParamBean,
			@PathParam("userID") Long userID) {
		ExecutionEngine engine = new ExecutionEngine(db);
		String query = "start n=node("
				+ userID
				+ ") match (d: Diary) -[:writtenBy]-> (n) return \"all\" as type, count(d.mood) as count";
		for (String mood : moodParamBean.getMoods()) {
			query += " union all match (" + mood + ":Diary {mood: \"" + mood
					+ "\"}) -[:writtenBy]-> n return \"" + mood
					+ "\" as type" + ", count(" + mood + ".mood) as count";
		}
		ResourceIterator<Map<String, Object>> resourceIterator = engine
				.execute(query).iterator();
		List<Map<String, Object>> results = Lists
				.newArrayList(resourceIterator);
		Map<String, Double> statistic = new HashMap<>();
		Double total = (long) results.get(0).get("count") * 1.0;
		for (Map<String, Object> result : results) {
			statistic.put(((String) result.get("type")),
					((long) result.get("count")) / total);
		}
		return Response.ok(new GenericEntity<Map<String, Double>>(statistic) {
		}).build();
	}
}
