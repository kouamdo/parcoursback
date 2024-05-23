package cmr.notep.repository;

import cmr.notep.dao.PersonneEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface PersonneRepository extends JpaRepository<PersonneEntity, String> {
}
