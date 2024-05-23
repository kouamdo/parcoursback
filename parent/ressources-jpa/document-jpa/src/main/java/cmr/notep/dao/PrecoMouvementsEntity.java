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
@Table(name = "precomouvements")
public class PrecoMouvementsEntity {

    @Id
    @Column(name="id", nullable = false)
    private String id ;

    @Column(name="libelle",nullable = false)
    private String libelle ;

    @Column(name = "etat")
    private boolean etat ;

    @Column(name = "datecreation",nullable = false)
    private LocalDate dateCreation ;

    @Column(name="datemodification")
    private LocalDate dateModification ;

    @Column(name="typemouvement")
    private String typeMouvement ;

    @ManyToMany(mappedBy = "precoMouvementsEntities")
    private List<DocumentsEntity> documentsEntities ;

    @OneToMany(mappedBy = "precoMouvementsEntity" , fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("precomouvementsqte")
    private List<PrecoMouvementsQteEntity> precoMouvementsQteEntities;

    @ManyToMany(mappedBy = "precoMouvementsEntityList")
    private List<MouvementEntity> mouvementEntityList ;
}
