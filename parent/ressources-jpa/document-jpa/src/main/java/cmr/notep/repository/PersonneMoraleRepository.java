package cmr.notep.repository;

import cmr.notep.dao.PersonnesMoralesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PersonneMoraleRepository extends JpaRepository<PersonnesMoralesEntity, String> {

    @Query(value = "SELECT pe.personnesmorales_id , pe.raisonsociale , pe.code , pe.datemodification, "+
            "p.id, p.adresse, p.mail, p.telephone, p.qrcodevalue, p.datecreation, p.datemodification "+
            "FROM personnesmorales pe INNER JOIN personnes p ON "+
            " pe.personnesmorales_id = p.id "+
            "WHERE pe.raisonsociale LIKE %:value%", nativeQuery = true)
    List<PersonnesMoralesEntity> findByRaisonSociale(@Param("value")String value);
}
