package cmr.notep.repository;


import cmr.notep.dao.MouvementEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MouvementRepository extends JpaRepository<MouvementEntity, String> {
}
