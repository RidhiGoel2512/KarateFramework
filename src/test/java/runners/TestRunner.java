package runners;

import com.intuit.karate.Results;
import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Results testAPI() {
        return Karate.run("classpath:features")
                .tags("@data")
                .parallel(3);
    }
}