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
    private LocalDate dateCreation;

    @Column(name = "datemodification")
    private LocalDate dateModification;

    @Column(name = "quantite")
    private int quantite ;

    @Column(name = "prix")
    private double prix;

    @Column(name = "unite")
    private Unite unite ;

    @OneToMany(mappedBy = "ressourcesEntity", fetch = FetchType.LAZY)
    @Mapping("precomouvementsqte")
    private List<PrecoMouvementsQteEntity> precoMouvementsQteEntities;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_familles")
    @Mapping("familles")
    private FamillesEntity famillesEntity;

    @OneToMany(mappedBy = "ressourcesEntity" , fetch = FetchType.LAZY)
    @Mapping("mouvement")
    private List<MouvementEntity> mouvementEntityList;
}
