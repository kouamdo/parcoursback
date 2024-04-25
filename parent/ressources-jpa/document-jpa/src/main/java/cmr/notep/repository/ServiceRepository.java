package cmr.notep.repository;

import cmr.notep.dao.ServiceEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServiceRepository extends JpaRepository<ServiceEntity,String> {
}
