package cmr.notep.repository;

import cmr.notep.dao.FilesAttentesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FilesAttentesRepository extends JpaRepository<FilesAttentesEntity, String> {
}
