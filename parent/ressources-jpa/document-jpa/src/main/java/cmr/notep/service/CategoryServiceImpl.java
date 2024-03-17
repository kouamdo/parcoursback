package cmr.notep.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import cmr.notep.dao.CategoryEntity;
import cmr.notep.repository.CategoryRepository;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    public CategoryRepository categoryRepo ;

    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepo = categoryRepository;
    }

    @SuppressWarnings("null")
    public Optional<CategoryEntity> GetCategory(String Id_category) {
        return this.categoryRepo.findById(Id_category);
    }

    @SuppressWarnings("null")
    @Override
    public CategoryEntity SetCategory(String Id_category, CategoryEntity new_category) {
        this.categoryRepo.deleteById(Id_category);
        return this.categoryRepo.save(new_category);
    }

    @Override
    public CategoryEntity SaveCategory(CategoryEntity category) {
        return this.categoryRepo.save(category);
    }

    @Override
    public void DeleteCategory(String id) {
        this.categoryRepo.deleteById(id);
    }
    
}
