package cmr.notep.dao;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "familles")
public class FamilleEntity {
    @Id
    @Column(name = "id" , nullable = false)
    private String id ;

    @Column(name = "libelle")
    private String libelle;

    @Column(name = "description")
    private String description;

    @Column(name = "etat")
    private Boolean etat ;

    @Column(name = "datecreation")
    private Date dateCreation;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_precomouvementsqte")
    @Mapping("precomouvementsqte")
    private PrecoMouvementsQteEntity precoMouvementsQteEntity ;

    @OneToMany(mappedBy = "familleEntity" , fetch = FetchType.LAZY)
    @Mapping("ressources")
    private List<RessourceEntity> ressourceEntities;


}
