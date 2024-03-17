package cmr.notep.service;

import java.util.Optional;

import cmr.notep.dao.CategoryEntity;

public interface CategoryService {

    public Optional<CategoryEntity> GetCategory(String Id_category);
    public CategoryEntity SetCategory (String Id_category , CategoryEntity category);
    public CategoryEntity SaveCategory(CategoryEntity category);
    public void DeleteCategory(String id);
}
