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
import org.springframework.data.neo4j.conversion.Result;
import org.springframework.data.neo4j.conversion.ResultConverter;
import org.springframework.data.neo4j.mapping.MappingPolicy;
import org.springframework.stereotype.Component;

import com.bond.pamela.domain.Diary;
import com.bond.pamela.domain.User;
import com.bond.pamela.domain.factory.DiaryFactory;
import com.bond.pamela.persistence.DirayRepository;
import com.bond.pamela.persistence.UserRepository;

@Component
@Path("/diary")
public class DiaryService {
	@Autowired
	GraphDatabaseService db;
	@Autowired
	DirayRepository repository;
	@Autowired
	UserRepository userRepository;

	@Path("/create/{userID: \\d{1,}}")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public Response create(Map<String, Object> parameters,
			@PathParam("userID") Long id) throws Exception {
		try (Transaction tx = db.beginTx()) {
			Diary diary = (Diary) DiaryFactory.getInstance().create(parameters);
			User user = userRepository.findOne(id);
			diary.setAuthor(user);
			repository.save(diary);
			tx.success();
			return Response.ok().build();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Path("/{id: \\d{1,}}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response get(@PathParam("id") Long id) throws Exception {
		try (Transaction tx = db.beginTx()) {
			Diary diary = repository.findOne(id);
			tx.success();
			return Response.ok(diary.toRep()).build();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Path("/{startIndex: \\d{1,}}/{pageSize: \\d{1,}}/{userID: \\d{1,}}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response fetch(@PathParam("startIndex") int startIndex,
			@PathParam("pageSize") int pageSize, @PathParam("userID") Long id)
			throws Exception {
		try (Transaction tx = db.beginTx()) {
			String query = "start n=node({id}) match (d: Diary) -[:writtenBy]-> (n) return d skip {startIndex} limit {pageSize}";
			Map<String, Object> parameters = new HashMap<>();
			parameters.put("startIndex", startIndex);
			parameters.put("pageSize", pageSize);
			parameters.put("id", id);
			Result<Diary> diaries = repository.query(query, parameters);
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
			List<Map> results = jsonReps.as(List.class);
			return Response.ok(new GenericEntity<List<Map>>(results) {
			}).build();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Path("/{startIndex: \\d{1,}}/{pageSize: \\d{1,}}/{userID: \\d{1,}}/{mood: [a-zA-Z]{1,}}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response fetchByMood(@PathParam("startIndex") int startIndex,
			@PathParam("pageSize") int pageSize,
			@PathParam("mood") String mood, @PathParam("userID") Long id)
			throws Exception {
		try (Transaction tx = db.beginTx()) {
			Map<String, Object> params = new HashMap<>();
			params.put("startIndex", startIndex);
			params.put("pageSize", pageSize);
			params.put("mood", mood);
			params.put("id", id);

			String query = "";
			if (mood.equals("all"))
				query = "start n=node({id}) match (d: Diary) -[:writtenBy]-> (n) return d skip {startIndex} limit {pageSize}";
			else
				query = "start n=node({id}) match (d: Diary {mood: {mood}}) -[:writtenBy]-> (n) return d skip {startIndex} limit {pageSize}";

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
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Path("/{id: \\d{1,}}")
	@DELETE
	public Response delete(@PathParam("id") Long id) {
		try (Transaction tx = db.beginTx()) {
			repository.delete(id);
			tx.success();
			return Response.ok().build();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
