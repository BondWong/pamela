package com.bond.pamela.persistence;

import org.springframework.data.neo4j.annotation.Query;
import org.springframework.data.neo4j.repository.GraphRepository;
import org.springframework.stereotype.Repository;

import com.bond.pamela.domain.Diary;
import com.bond.pamela.persistence.result.Moods;
import com.bond.pamela.persistence.result.ThumbnailResult;

@Repository
public interface DirayRepository extends GraphRepository<Diary> {
	@Query("match (d: Diary) return collect(distinct d.mood)")
	Moods fetchAllMoods();

	@Query("match (d: Diary) return collect(d.images)")
	ThumbnailResult fetchAllImages();

	@Query("match (d: Diary) with d, count(d.images) as numberOfImagePerDiary return sum(numberOfImagePerDiary)")
	Long countImages();

	@Query("match (d: Diary) return d.mood order by d.id desc limit 1")
	String getLatestMood();
}
// 218.244.137.34