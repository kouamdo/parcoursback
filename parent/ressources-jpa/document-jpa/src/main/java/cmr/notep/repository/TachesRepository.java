package cmr.notep.repository;

import cmr.notep.dao.TachesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TachesRepository extends JpaRepository<TachesEntity,String> {
}
