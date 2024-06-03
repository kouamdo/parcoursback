package cmr.notep.repository;

import cmr.notep.dao.ValidationsEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ValidationsRepository extends JpaRepository<ValidationsEntity, String> {
}
