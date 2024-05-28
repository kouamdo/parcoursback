package cmr.notep.business;

import cmr.notep.dao.CategoriesEntity;
import cmr.notep.dao.DaoAccessorService;
import cmr.notep.modele.Categories;
import cmr.notep.repository.CategoriesRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

import static cmr.notep.config.DocumentConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional
public class CategoriesBusiness {
    private final DaoAccessorService daoAccessorService;

    public CategoriesBusiness(DaoAccessorService daoAccessorService){
        this.daoAccessorService = daoAccessorService ;
    }

    public Categories avoirCategorie(String id) {
        return dozerMapperBean.map(
                this.daoAccessorService.getRepository(CategoriesRepository.class)
                        .findById(id)
                        .orElseThrow(()->new RuntimeException("Categorie inexistante")), Categories.class);
    }

    public List<Categories> avoirToutCategorie() {
        return daoAccessorService.getRepository(CategoriesRepository.class).findAll()
                .stream().map(cat ->dozerMapperBean.map(cat, Categories.class))
                .collect(Collectors.toList());
    }

    public void supprimerCategory(Categories categories)
    {
        daoAccessorService.getRepository(CategoriesRepository.class)
                .deleteById(categories.getId());
    }

    public Categories posterCategorie(Categories categories) {
        return dozerMapperBean.map( this.daoAccessorService.getRepository(CategoriesRepository.class)
                .save(dozerMapperBean.map(categories, CategoriesEntity.class)), Categories.class);
    }
}
