package domainTest;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
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
public class AspectTest {
	private User bond = null;
	private User pam = null;
	@Autowired
	UserRepository repository;
	
	@Before
	@Transactional
	public void setUpData() {
		try {
			Map<String, Object> parameters = new HashMap<>();
			parameters.put("name", "Pamela");
			parameters.put("password", "2663");
			pam = (User) UserFactory.getInstance().create(parameters);

			parameters.put("name", "Bond");
			parameters.put("password", "1226");
			bond = (User) UserFactory.getInstance().create(parameters);

			bond.setLover(pam);
			pam.setLover(bond);

			List<User> users = new ArrayList<>();
			users.add(pam);
			users.add(bond);

			repository.save(users);			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Test
	@Transactional
	public void test() {
		try {
			User b = repository.findOne(bond.getId());
			assertEquals(pam.getName(), b.getLover().getName());
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
