package cmr.notep.repository;

import cmr.notep.dao.MissionsEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MissionRepository extends JpaRepository<MissionsEntity, String> {
}
