package cmr.notep.repository;

import cmr.notep.dao.FamillesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FamilleRepository extends JpaRepository<FamillesEntity, String> {
}
