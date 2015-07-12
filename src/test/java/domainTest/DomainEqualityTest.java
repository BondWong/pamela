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
import com.bond.pamela.domain.User;
import com.bond.pamela.domain.factory.DiaryFactory;
import com.bond.pamela.domain.factory.UserFactory;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "/applicationTestContext.xml" })
public class DomainEqualityTest {
	@Autowired
	Neo4jTemplate template;

	@Test
	@Transactional
	public void testEqual() {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("title", "test");
		params.put("weather", "sun");
		params.put("mood", "happy");
		params.put("htmlContent", "<a></a>");
		params.put("images", new ArrayList<>());

		Diary diary = (Diary) DiaryFactory.getInstance().create(params);
		User user = (User) UserFactory.getInstance().create(params);

		assertFalse(diary.equals(user));
		assertTrue(diary.equals(diary));

		Diary diary2 = (Diary) DiaryFactory.getInstance().create(params);
		assertFalse(diary.equals(diary2));
	}

}
