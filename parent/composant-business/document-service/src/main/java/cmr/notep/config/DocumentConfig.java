package cmr.notep.config;

import cmr.notep.dao.AttributsEntity;
import cmr.notep.dao.CategoryEntity;
import cmr.notep.modele.Attributs;
import cmr.notep.modele.Categories;
import org.dozer.DozerBeanMapper;
import org.dozer.loader.api.BeanMappingBuilder;
import org.dozer.loader.api.TypeMappingOptions;
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
