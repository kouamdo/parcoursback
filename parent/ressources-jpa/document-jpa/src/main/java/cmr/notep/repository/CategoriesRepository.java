package cmr.notep.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cmr.notep.dao.CategoriesEntity;

public interface CategoriesRepository extends JpaRepository<CategoriesEntity, String>  {
    
}
