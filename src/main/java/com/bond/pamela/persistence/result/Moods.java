package com.bond.pamela.persistence.result;

import org.springframework.data.neo4j.annotation.QueryResult;
import org.springframework.data.neo4j.annotation.ResultColumn;

@QueryResult
public interface Moods {
	@ResultColumn("collect(distinct d.mood)")
	Iterable<String> getMoods();
}
