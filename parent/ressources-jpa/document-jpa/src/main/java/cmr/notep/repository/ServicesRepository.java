package cmr.notep.repository;

import cmr.notep.dao.ServicesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServicesRepository extends JpaRepository<ServicesEntity,String> {
}
