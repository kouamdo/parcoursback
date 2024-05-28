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
    private int quantite ;
    @Column(name = "seuilalerte")
    private int seuilAlerte;
    @Column(name = "prixentree")
    private double prixEntree;
    @Column(name = "prixsortie")
    private double prixSortie;
    @Column(name = "unite")
    private Unite unite ;

    @OneToMany(mappedBy = "ressourcesEntity",  fetch = FetchType.LAZY)
    @Mapping("precoMouvementsQtes")
    private List<PrecoMouvementsQtesEntity> precoMouvementsQtesEntities;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familles_id")
    @Mapping("familles")
    private FamillesEntity famillesEntity;

}
