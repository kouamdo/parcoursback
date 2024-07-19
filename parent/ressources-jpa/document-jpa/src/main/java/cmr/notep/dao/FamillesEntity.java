package cmr.notep.dao;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
    @GeneratedValue
    @Column(name = "id" , nullable = false, updatable = false, columnDefinition = "UUID")
    private String id ;
    @Column(name = "libelle")
    private String libelle;
    @Column(name = "description")
    private String description;
    @Column(name = "etat")
    private Boolean etat ;
    @Column(name = "datecreation", updatable = false)
    private Date dateCreation;
    @Column(name = "datemodification")
    private Date dateModification;

    @ManyToMany
    @JoinTable(name = "sapplique",
            joinColumns = @JoinColumn(name = "familles_id"),
            inverseJoinColumns = @JoinColumn(name = "precomouvementsqtes_id"))
    @Mapping("precoMouvementsQtes")
    private List<PrecoMouvementsQtesEntity> precoMouvementsQtesEntities;

    @OneToMany(mappedBy = "famillesEntity", fetch = FetchType.LAZY)
    @Mapping("ressources")
    private List<RessourcesEntity> ressourceEntities;

    @ManyToMany(mappedBy = "famillesEntities", fetch = FetchType.LAZY)
    @JoinColumn(name = "promotions_id")
    @Mapping("promotions")
    private List<PromotionsEntity> promotionsEntities;
}