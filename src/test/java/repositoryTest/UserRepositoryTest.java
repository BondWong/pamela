package repositoryTest;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.bond.pamela.domain.User;
import com.bond.pamela.domain.factory.UserFactory;
import com.bond.pamela.persistence.UserRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "/applicationTestContext.xml" })
public class UserRepositoryTest {
	@Autowired
	UserRepository repository;

	@Transactional
	@Test
	public void testCreateUser() {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("name", "Bond");
		parameters.put("password", "012260");
		User user = (User) UserFactory.getInstance().create(parameters);
		repository.save(user);
		User retrivedUser = repository.findOne(user.getId());
		assertEquals(user, retrivedUser);
	}

}
