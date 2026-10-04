package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class TestRunner {

    @Test
    void testAPI() {

        Results results = Runner.path("classpath:features")
                .tags(System.getProperty("karate.tag", "@data"))
                .parallel(3);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}