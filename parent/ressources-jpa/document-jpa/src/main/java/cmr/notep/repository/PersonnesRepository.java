package cmr.notep.repository;

import cmr.notep.dao.PersonnesEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface PersonnesRepository extends JpaRepository<PersonnesEntity, String> {
}
