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
@Table(name = "mission")
public class MissionsEntity {
    @Id
    @Column(name="id", nullable = false)
    private String id ;

    @Column(name="libelle",nullable = false)
    private String libelle ;

    @Column(name="description")
    private String description;

    @Column(name = "etat")
    private boolean etat ;

    @Column(name = "datecreation",nullable = false)
    private LocalDate dateCreation ;

    @Column(name="datemodification")
    private LocalDate dateModification ;

    @ManyToMany(fetch = FetchType.LAZY , cascade = {CascadeType.ALL} )
    @JoinTable(name = "traiter",
        joinColumns = @JoinColumn(name = "id_mission"),
            inverseJoinColumns = @JoinColumn(name="id_document")
    )
    @Mapping("documents")
    private List<DocumentsEntity> documentsEntities ;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinColumn(name = "id_service")
    @Mapping("tache")
    private ServiceEntity taches ;
}
