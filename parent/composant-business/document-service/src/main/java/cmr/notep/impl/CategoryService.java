package cmr.notep.impl;

import cmr.notep.business.CategoryBusiness;
import cmr.notep.modele.Categorie;
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

    public Categorie avoirCategorie(String id) {
        return categoryBusiness.avoirCategorie(id);
    }

    public List<Categorie> avoirToutCategorie() { return categoryBusiness.avoirToutCategorie(); }

    public void supprimerCategorie(@NonNull Categorie categorie) { categoryBusiness.supprimerCategory(categorie); }

    public Categorie posterCategorie(@NonNull Categorie categorie){ return categoryBusiness.posterCategorie(categorie);}

}
