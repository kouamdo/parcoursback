package cmr.notep.repository;

import cmr.notep.dao.DocumentsEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DocumentsRepository extends JpaRepository<DocumentsEntity, String> {

}
