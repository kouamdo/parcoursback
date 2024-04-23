package cmr.notep.repository;

import cmr.notep.dao.MissionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MissionRepository extends JpaRepository<MissionEntity, String> {
}
