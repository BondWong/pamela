package com.bond.pamela.persistence.result;

import org.springframework.data.neo4j.annotation.QueryResult;
import org.springframework.data.neo4j.annotation.ResultColumn;

@QueryResult
public interface ThumbnailResult {
	@ResultColumn("collect(d.images)")
	Iterable<String> getThumbnails();
}
