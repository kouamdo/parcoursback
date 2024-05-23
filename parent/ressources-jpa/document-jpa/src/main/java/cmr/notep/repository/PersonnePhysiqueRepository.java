package cmr.notep.repository;

import cmr.notep.dao.PersonneMoraleEntity;
import cmr.notep.dao.PersonnePhysiqueEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonnePhysiqueRepository extends JpaRepository<PersonnePhysiqueEntity, String> {
}
