package cmr.notep.repository;

import cmr.notep.dao.TicketsFilesAttentesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TicketsFilesAttentesRepository extends JpaRepository<TicketsFilesAttentesEntity, String> {
}
