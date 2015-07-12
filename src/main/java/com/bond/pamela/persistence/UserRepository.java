package com.bond.pamela.persistence;

import org.springframework.data.neo4j.repository.GraphRepository;
import org.springframework.stereotype.Repository;

import com.bond.pamela.domain.User;

@Repository
public interface UserRepository extends GraphRepository<User> {

}
