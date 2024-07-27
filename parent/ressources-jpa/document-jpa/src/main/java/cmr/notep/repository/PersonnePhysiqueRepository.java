package cmr.notep.repository;

import cmr.notep.dao.PersonnesPhysiquesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonnePhysiqueRepository extends JpaRepository<PersonnesPhysiquesEntity, String> {
}
