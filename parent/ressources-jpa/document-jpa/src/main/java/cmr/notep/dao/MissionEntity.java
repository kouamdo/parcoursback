package cmr.notep.dao;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import net.bytebuddy.asm.Advice;
import org.dozer.Mapping;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "mission")
public class MissionEntity {
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
    private LocalDate datecreation ;

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
    @JoinColumn(name = "id_tache")
    @Mapping("tache")
    private TachesEntity taches ;
}
