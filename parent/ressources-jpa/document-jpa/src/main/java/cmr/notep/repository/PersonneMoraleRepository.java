package cmr.notep.repository;

import cmr.notep.dao.PersonneMoraleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonneMoraleRepository extends JpaRepository<PersonneMoraleEntity, String> {
}
