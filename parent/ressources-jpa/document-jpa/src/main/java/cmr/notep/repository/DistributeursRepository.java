package cmr.notep.repository;

import cmr.notep.dao.DistributeursEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DistributeursRepository extends JpaRepository<DistributeursEntity, String>  {

    @Query(value = "SELECT p.id, p.datemodification, p.code, p.raisonsociale "+
            "FROM personnes_s p "+
            "WHERE p.raisonsociale LIKE %:value% AND p.person_type = 'distributeurs'", nativeQuery = true)
    List<DistributeursEntity> findByRaisonSociale(@Param("value") String value);
}
