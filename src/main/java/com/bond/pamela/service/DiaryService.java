package com.bond.pamela.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.neo4j.conversion.Result;
import org.springframework.data.neo4j.conversion.ResultConverter;
import org.springframework.data.neo4j.mapping.MappingPolicy;
import org.springframework.stereotype.Component;

import com.bond.pamela.domain.Diary;
import com.bond.pamela.domain.factory.DiaryFactory;
import com.bond.pamela.persistence.DirayRepository;

@Component
@Path("/diary")
public class DiaryService {
	@Autowired
	GraphDatabaseService db;
	@Autowired
	DirayRepository repository;

	@Path("/create")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public Response create(Map<String, Object> parameters) throws Exception {
		try (Transaction tx = db.beginTx()) {
			Diary diary = (Diary) DiaryFactory.getInstance().create(parameters);
			repository.save(diary);
			tx.success();
			return Response.ok().build();
		}
	}

	@Path("/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response get(@PathParam("id") Long id) throws Exception {
		try (Transaction tx = db.beginTx()) {
			Diary diary = repository.findOne(id);
			tx.success();
			return Response.ok(diary.toRep()).build();
		}
	}

	@Path("/{page}/{size}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response fetch(@PathParam("page") int page,
			@PathParam("size") int size) throws Exception {
		try (Transaction tx = db.beginTx()) {
			Pageable pageable = new PageRequest(page, size);
			Page<Diary> diaries = repository.findAll(pageable);
			Page<Map<String, Object>> jsonReps = diaries
					.map(new Converter<Diary, Map<String, Object>>() {

						@Override
						public Map<String, Object> convert(Diary diary) {
							// TODO Auto-generated method stub
							return diary.toRep();
						}

					});
			return Response.ok(
					new GenericEntity<List<Map<String, Object>>>(jsonReps
							.getContent()) {
					}).build();
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Path("/{startIndex}/{pageSize}/{mood}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response fetchByMood(@PathParam("startIndex") int startIndex,
			@PathParam("pageSize") int pageSize, @PathParam("mood") String mood)
			throws Exception {
		try (Transaction tx = db.beginTx()) {
			Map<String, Object> params = new HashMap<>();
			params.put("startIndex", startIndex);
			params.put("pageSize", pageSize);
			params.put("mood", mood);

			String query = "";
			if (mood.equals("all"))
				query = "match (d: Diary) return d skip {startIndex} limit {pageSize}";
			else
				query = "match (d: Diary {mood: {mood}}) return d skip {startIndex} limit {pageSize}";

			Result<Diary> diaries = repository.query(query, params);
			Result<Map> jsonReps = diaries.to(Map.class,
					new ResultConverter<Diary, Map>() {

						@Override
						public Map convert(Diary diary, Class<Map> type) {
							// TODO Auto-generated method stub
							return diary.toRep();
						}

						@Override
						public Map convert(Diary diary, Class<Map> type,
								MappingPolicy policy) {
							// TODO Auto-generated method stub
							return diary.toRep();
						}

					});
			List results = jsonReps.as(List.class);
			return Response.ok(new GenericEntity<List>(results) {
			}).build();
		}
	}

	@Path("/{id}")
	@DELETE
	public Response delete(@PathParam("id") Long id) {
		try (Transaction tx = db.beginTx()) {
			repository.delete(id);
			tx.success();
			return Response.ok().build();
		}
	}
}
