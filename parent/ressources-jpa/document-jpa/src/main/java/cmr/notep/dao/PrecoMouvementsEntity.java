package cmr.notep.dao;


import lombok.Getter;
import lombok.Setter;

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
    private LocalDate datecreation ;

    @Column(name="datemodification")
    private LocalDate dateModification ;

    @ManyToMany(mappedBy = "precoMouvementssuivie")
    private List<DocumentsEntity> suivreDocuments ;

}
