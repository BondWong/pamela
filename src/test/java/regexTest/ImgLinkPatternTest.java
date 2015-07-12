package regexTest;

import static org.junit.Assert.*;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;

public class ImgLinkPatternTest {
	private static String json = "{\"width\":600,\"height\":600,\"link\":\"thumbnail-test-2015-07-09-happy.jpeg\",\"name\":\"test\"},{\"width\":664,\"height\":1000,\"link\":\"images/uploadedFile/test-2015-07-09-happy.jpeg\",\"name\":\"test\"},{\"width\":600,\"height\":600,\"link\":\"thumbnail-test-2015-07-09-happy.jpeg\",\"name\":\"test\"}";

	@Test
	public void test() {
		Pattern pattern = Pattern
				.compile("\"link\":\"(thumbnail-.{1,}-\\d{4}-\\d{2}-\\d{2}\\-[a-zA-Z]{1,10}.\\w{2,4})\"");
		Matcher m = pattern.matcher(json);

		boolean result = false;

		while (m.find()) {
			result = true;
			System.out.println(m.group());
		}

		assertTrue(result);
	}

}
