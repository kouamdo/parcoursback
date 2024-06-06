package cmr.notep.repository;

import cmr.notep.dao.PersonnesMoraleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonneMoraleRepository extends JpaRepository<PersonnesMoraleEntity, String> {
}
