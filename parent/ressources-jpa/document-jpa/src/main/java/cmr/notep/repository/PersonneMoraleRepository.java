package cmr.notep.repository;

import cmr.notep.dao.PersonnesMoralesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonneMoraleRepository extends JpaRepository<PersonnesMoralesEntity, String> {
}
