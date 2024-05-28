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
    private Date dateCreation ;

    @Column(name="datemodification")
    private Date dateModification ;

    @Column(name="typemouvement")
    private String typeMouvement ;

    @ManyToMany(mappedBy = "precoMouvementsEntities")
    private List<DocumentsEntity> documentsEntities ;

    @OneToMany(mappedBy = "precoMouvementsEntity" , fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("precoMouvementsQte")
    private List<PrecoMouvementsQtesEntity> precoMouvementsQtesEntities;
}
