package cmr.notep;

import com.jayway.restassured.RestAssured;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;

import static com.jayway.restassured.RestAssured.given;
import static com.jayway.restassured.RestAssured.when;
import static org.hamcrest.CoreMatchers.is;


//@WebAppConfiguration
//@IntegrationTest({"server.port:0",
//        "spring.datasource.url:jdbc:h2:mem:document;DB_CLOSE_ON_EXIT=FALSE"})
public class HelloControllerTest {
   // @Value("${local.server.port}")
    int port;

   // @BeforeAll
    public void setUp() throws Exception {
        RestAssured.port = port;
    }

   // @Test
    public void testHello() throws Exception {
        when().get("/").then()
                .body(is("Hello World!"));
    }

    //@Test
    public void testCalc() throws Exception {
        given().param("left", 100)
                .param("right", 200)
                .get("/calc")
                .then()
                .body("left", is(100))
                .body("right", is(200))
                .body("answer", is(300));
    }
}