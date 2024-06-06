package cmr.notep.repository;

import cmr.notep.dao.PersonnesPhysiqueEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonnePhysiqueRepository extends JpaRepository<PersonnesPhysiqueEntity, String> {
}
