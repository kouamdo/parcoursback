package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "familles")
public class FamillesEntity {
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
    private LocalDate dateCreation;
    @Column(name = "datemodification")
    private LocalDate dateModification;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_precomouvementsqte")
    @Mapping("precomouvementsqte")
    private PrecoMouvementsQteEntity precoMouvementsQteEntity ;

    @OneToMany(mappedBy = "famillesEntity", fetch = FetchType.LAZY)
    @Mapping("ressources")
    private List<RessourcesEntity> ressourceEntities;


}
