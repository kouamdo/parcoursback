package cmr.notep.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cmr.notep.dao.MouvementEntity;

public interface MouvementRepository extends JpaRepository<MouvementEntity, String> {
    
}
