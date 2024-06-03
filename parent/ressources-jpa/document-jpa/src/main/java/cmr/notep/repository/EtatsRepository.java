package cmr.notep.repository;

import cmr.notep.dao.EtatsEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EtatsRepository extends JpaRepository<EtatsEntity, String> {
}
