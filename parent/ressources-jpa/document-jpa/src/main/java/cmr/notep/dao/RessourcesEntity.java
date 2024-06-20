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
@Table(name = "ressources")
public class RessourcesEntity {
    @Id
    @Column(name = "id" , nullable = false)
    private String id ;
    @Column(name = "libelle")
    private String libelle;
    @Column(name = "etat")
    private Boolean etat;
    @Column(name = "datecreation")
    private Date dateCreation;
    @Column(name = "datemodification")
    private Date dateModification;
    @Column(name = "quantite")
    private Integer quantite ;
    @Column(name = "seuilalerte")
    private Integer seuilAlerte;
    @Column(name = "prixentree")
    private Double prixEntree;
    @Column(name = "prixsortie")
    private Double prixSortie;
    @Column(name = "unite")
    private String unites ;

    @OneToMany(mappedBy = "ressourcesEntity",  fetch = FetchType.LAZY)
    @Mapping("precoMouvementsQtes")
    private List<PrecoMouvementsQtesEntity> precoMouvementsQtesEntities;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familles_id")
    @Mapping("famille")
    private FamillesEntity famillesEntity;

    @OneToMany(mappedBy = "ressourcesEntity" , fetch = FetchType.LAZY)
    @Mapping("mouvements")
    private List<MouvementsEntity> mouvementsEntities;

    @ManyToOne
    @JoinColumn(name = "promotions_id")
    @Mapping("promotion")
    private PromotionsEntity promotionsEntities;
}
