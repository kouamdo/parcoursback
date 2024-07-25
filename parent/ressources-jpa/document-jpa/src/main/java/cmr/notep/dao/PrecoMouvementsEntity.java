package cmr.notep.dao;


import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "precomouvements")
public class PrecoMouvementsEntity {

    @Id
    @GeneratedValue
    @Column(name="id", nullable = false, updatable = false, columnDefinition = "UUID")
    private UUID id ;

    @Column(name="libelle",nullable = false)
    private String libelle ;

    @Column(name = "etat")
    private boolean etat ;

    @Column(name = "datecreation", updatable = false,nullable = false)
    private LocalDate dateCreation ;
    @Column(name="datemodification")
    private LocalDate dateModification ;

    @Column(name="typemouvement")
    private String typeMouvement ;
    @ManyToMany(mappedBy = "precoMouvementsRespecterEntityties")
    @Mapping("mouvementsCorrects")
    private List<MouvementsEntity> mouvementsCorrectsEntities ;
    @ManyToMany(mappedBy = "precoMouvementsViolerEntityties")
    @Mapping("mouvementsIncorrects")
    private List<MouvementsEntity> mouvementsIncorrectsEntities ;

    @ManyToMany(mappedBy = "precoMouvementsEntityList")
    @Mapping("mouvements")
    private List<MouvementsEntity> mouvementsEntities ;


    @ManyToMany(mappedBy = "precoMouvementsEntities")
    @Mapping("documents")
    private List<DocumentsEntity> documentsEntities ;

    @OneToMany(mappedBy = "precoMouvementsEntity" , fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("precoMouvementsQtes")
    private List<PrecoMouvementsQtesEntity> precoMouvementsQteEntities;
}
