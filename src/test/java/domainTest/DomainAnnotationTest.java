package domainTest;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.neo4j.support.Neo4jTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.bond.pamela.domain.Diary;
import com.bond.pamela.domain.factory.DiaryFactory;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "/applicationTestContext.xml" })
public class DomainAnnotationTest {
	@Autowired
	Neo4jTemplate template;

	@Test
	@Transactional
	public void persistedMovieShouldBeRetrievableFromGraphDb() {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("title", "test");
		params.put("weather", "sun");
		params.put("mood", "happy");
		params.put("htmlContent", "<a></a>");
		params.put("images", new ArrayList<>());

		Diary firstDiary = template.save((Diary) DiaryFactory.getInstance()
				.create(params));
		Diary retrievedDiary = template
				.findOne(firstDiary.getId(), Diary.class);
		Diary secondDiary = template.save((Diary) DiaryFactory.getInstance()
				.create(params));
		Diary retrievedSecondDiary = template.findOne(secondDiary.getId(),
				Diary.class);

		assertEquals("retrieved diary matches persisted one", firstDiary,
				retrievedDiary);
		assertEquals("retrieved second diary matches persisted one",
				secondDiary, retrievedSecondDiary);
		assertEquals("retrieved diary title matches", firstDiary.getId(),
				retrievedDiary.getId());
	}

}
