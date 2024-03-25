package cmr.notep.business;

import cmr.notep.dao.DaoAccessorService;
import cmr.notep.modele.Categorie;
import cmr.notep.repository.CategoryRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

import static cmr.notep.config.DocumentConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional
public class CategoryBusiness {
    private final DaoAccessorService daoAccessorService;

    public CategoryBusiness(DaoAccessorService daoAccessorService){
        this.daoAccessorService = daoAccessorService ;
    }

    public Categorie avoirCategorie(String id) {
        return dozerMapperBean.map(
                this.daoAccessorService.getRepository(CategoryRepository.class)
                        .findById(id)
                        .orElseThrow(()->new RuntimeException("Categorie inexistante")), Categorie.class);
    }

    public List<Categorie> avoirToutCategorie() {
        return daoAccessorService.getRepository(CategoryRepository.class).findAll()
                .stream().map(cat ->dozerMapperBean.map(cat, Categorie.class))
                .collect(Collectors.toList());
    }

}
