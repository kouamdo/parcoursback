package cmr.notep.repository;

import cmr.notep.dao.PersonnelsEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonnelsRepository extends JpaRepository<PersonnelsEntity, String> {
}
