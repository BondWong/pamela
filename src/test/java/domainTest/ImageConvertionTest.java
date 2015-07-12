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
import com.bond.pamela.domain.valueObject.Image;

@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "/applicationTestContext.xml" })
public class ImageConvertionTest {
	@Autowired
	Neo4jTemplate template;

	@Test
	@Transactional
	public void testImageConvertion() {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("title", "test");
		params.put("weather", "sun");
		params.put("mood", "happy");
		params.put("htmlContent", "<a></a>");
		params.put("images", new ArrayList<>());

		Image image = new Image(1, 2, "test", "name");
		Diary diary = (Diary) DiaryFactory.getInstance().create(params);

		diary.addImage(image);
		template.save(diary);
		diary = template.findOne(diary.getId(), Diary.class);
		assertTrue(diary.getImages().size() == 1);
	}

}
