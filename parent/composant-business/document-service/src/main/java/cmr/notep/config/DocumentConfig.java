package cmr.notep.config;

import org.dozer.DozerBeanMapper;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.annotation.PostConstruct;

@Configuration
@EnableTransactionManagement
public class DocumentConfig {
    public static DozerBeanMapper dozerMapperBean;
    @PostConstruct
    void init(){
        dozerMapperBean = new DozerBeanMapper();
    }

}
