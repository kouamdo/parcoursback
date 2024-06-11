package cmr.notep.repository;

import cmr.notep.dao.EtapesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EtapesRepository extends JpaRepository<EtapesEntity, String> {
}
