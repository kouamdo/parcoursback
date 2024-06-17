package cmr.notep.repository;

import cmr.notep.dao.PromotionsEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PromotionsRepository extends JpaRepository<PromotionsEntity, String> {
}
