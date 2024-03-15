package cmr.notep.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cmr.notep.dao.CategorieEntity;

public interface CategoryRepository extends JpaRepository<CategorieEntity, String>  {
    
}
