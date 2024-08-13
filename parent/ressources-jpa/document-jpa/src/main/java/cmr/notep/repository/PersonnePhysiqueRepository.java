package cmr.notep.repository;

import cmr.notep.dao.PersonnesPhysiquesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PersonnePhysiqueRepository extends JpaRepository<PersonnesPhysiquesEntity, String> {

    @Query(value = "SELECT pe.personnesphysique_id , pe.nom , pe.prenom , pe.sexe "+
            ", pe.datenaissance , pe.datemodification , "+
            "p.id, p.adresse, p.mail, p.telephone, p.qrcodevalue, p.datecreation, p.datemodification "+
            "FROM personnesphysique pe INNER JOIN personnes p ON "+
            " pe.personnesphysique_id = p.id "+
            "WHERE pe.nom LIKE %:value% OR pe.prenom LIKE %:value%", nativeQuery = true)
    List<PersonnesPhysiquesEntity> findByNomOrByPrenom(@Param("value")String value);
}
