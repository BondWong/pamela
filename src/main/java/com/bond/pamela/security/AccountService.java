package com.bond.pamela.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NewCookie;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.neo4j.conversion.Result;
import org.springframework.stereotype.Component;

import com.bond.pamela.domain.User;
import com.bond.pamela.domain.factory.UserFactory;
import com.bond.pamela.persistence.UserRepository;
import com.bond.pamela.utils.AutoLoginHelper;
import com.bond.pamela.utils.LoginHelper;
import com.bond.pamela.utils.OriginalURLSaver;

@Component
@Path("/account")
public class AccountService {
	@Autowired
	GraphDatabaseService db;
	@Autowired
	UserRepository repository;

	@Path("/initialize")
	@GET
	public Response initializeUser() {
		try (Transaction tx = db.beginTx()) {
			Map<String, Object> parameters = new HashMap<>();
			parameters.put("name", "Pamela");
			parameters.put("password", "2663");
			User pam = (User) UserFactory.getInstance().create(parameters);

			parameters.put("name", "Bond");
			parameters.put("password", "1226");
			User bond = (User) UserFactory.getInstance().create(parameters);

			List<User> users = new ArrayList<>();
			users.add(pam);
			users.add(bond);

			repository.save(users);
			tx.success();
			return Response.ok().build();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Path("/login")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response login(Map<String, Object> parameters,
			@Context HttpServletRequest request) {
		try (Transaction tx = db.beginTx()) {
			Result<User> result = repository
					.query("match (u: User {name: {name}, password: {password}}) return u",
							parameters);
			User user = result.singleOrNull();
			if (user != null) {
				HttpSession session = request.getSession();
				LoginHelper.addID(session.getId(), user.getId());
				boolean remember_me = (boolean) parameters.get("remember-me");

				Map<String, Object> results = user.toRep();
				results.put("originalURL", OriginalURLSaver.getInstance()
						.getURL(session.getId()));
				ResponseBuilder builder = Response
						.ok(new GenericEntity<Map<String, Object>>(results) {
						});
				if (remember_me) {
					// save PPAL
					AutoLoginHelper.put(session.getId(), user.getId());
					builder = builder.cookie(new NewCookie("PPAL", session
							.getId(), "/", null, null, 60 * 60 * 24 * 30,
							false, true));
				}

				return builder.build();
			}
			return Response.status(401).build();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Path("/logout")
	@POST
	public Response logout(@Context HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginHelper.removeID(session.getId());
		return Response.ok().build();
	}
}
