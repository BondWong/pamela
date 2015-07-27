package com.bond.pamela.persistence;

import org.springframework.data.neo4j.annotation.Query;
import org.springframework.data.neo4j.repository.GraphRepository;
import org.springframework.stereotype.Repository;

import com.bond.pamela.domain.Diary;
import com.bond.pamela.persistence.result.Moods;
import com.bond.pamela.persistence.result.ThumbnailResult;

@Repository
public interface DirayRepository extends GraphRepository<Diary> {
	@Query("start u=node({0}) match (d: Diary) -[:writtenBy]-> (u) return collect(distinct d.mood)")
	Moods fetchAllMoods(Long userID);

	@Query("start u=node({0}) match (d: Diary) -[:writtenBy]-> (u) return collect(d.images)")
	ThumbnailResult fetchAllImages(Long userID);

	@Query("start u=node({0}) match (d: Diary) -[:writtenBy]->(u) with d, count(d.images) as numberOfImagePerDiary return sum(numberOfImagePerDiary)")
	Long countImages(Long userID);

	@Query("start u=node({0}) match (d: Diary) -[:writtenBy]->(u) return d.mood order by d.id desc limit 1")
	String getLatestMood(Long userID);
}