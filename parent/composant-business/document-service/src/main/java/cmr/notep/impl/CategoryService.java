package cmr.notep.impl;

import cmr.notep.business.CategoryBusiness;
import cmr.notep.modele.Categories;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@Transactional
public class CategoryService {
    private final CategoryBusiness categoryBusiness ;
    public CategoryService(CategoryBusiness categoryBusiness) {
        this.categoryBusiness = categoryBusiness;
    }

    public Categories avoirCategorie(String id) {
        return categoryBusiness.avoirCategorie(id);
    }

    public List<Categories> avoirToutCategorie() { return categoryBusiness.avoirToutCategorie(); }

    public void supprimerCategorie(@NonNull Categories categories) { categoryBusiness.supprimerCategory(categories); }

    public Categories posterCategorie(@NonNull Categories categories){ return categoryBusiness.posterCategorie(categories);}

}
