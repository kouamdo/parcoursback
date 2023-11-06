package cmr.notep.config;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Configuration
@EnableAutoConfiguration
@ComponentScan(
        basePackages = {"cmr.notep"}
)
@Profile("ittest")
public class ItTestConfig {
}
