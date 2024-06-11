package cmr.notep.repository;

import cmr.notep.dao.ParcoursEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ParcoursRepository extends JpaRepository<ParcoursEntity, String> {
}
