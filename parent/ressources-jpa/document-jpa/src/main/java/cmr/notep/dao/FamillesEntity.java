package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.Date;
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
    private Date dateCreation;
    @Column(name = "datemodification")
    private Date dateModification;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "sapplique",
            joinColumns = @JoinColumn(name = "familles_id"),
            inverseJoinColumns = @JoinColumn(name = "precomouvementsqtes_id"))
    @Mapping("precoMouvementsQte")
    private List<PrecoMouvementsQtesEntity> precoMouvementsQtesEntities;

    @OneToMany(mappedBy = "famillesEntity", fetch = FetchType.LAZY)
    @Mapping("ressources")
    private List<RessourcesEntity> ressourceEntities;

    @ManyToOne
    @JoinColumn(name = "promotions_id")
    @Mapping("promotion")
    private PromotionsEntity promotionsEntity;
}