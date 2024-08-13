package cmr.notep.repository;

import cmr.notep.dao.DistributeursEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DistributeursRepository extends JpaRepository<DistributeursEntity, String>  {

    @Query(value = "SELECT d.distributeurs_id, d.datemodification, d.code, d.raisonsociale, "+
            "p.id, p.adresse, p.mail, p.telephone, p.qrcodevalue, p.datecreation, p.datemodification "+
            "FROM distributeurs d "+
            "INNER JOIN personnes p ON d.distributeurs_id = p.id "+
            "WHERE d.raisonsociale LIKE %:value%", nativeQuery = true)
    List<DistributeursEntity> findByRaisonSociale(@Param("value") String value);
}
