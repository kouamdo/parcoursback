package cmr.notep.repository;

import cmr.notep.dao.DocEtatsEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DocEtatsRepository extends JpaRepository<DocEtatsEntity, String> {
}
