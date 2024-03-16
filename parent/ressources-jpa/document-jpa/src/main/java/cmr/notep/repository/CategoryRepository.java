package cmr.notep.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cmr.notep.dao.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, String>  {
    
}
