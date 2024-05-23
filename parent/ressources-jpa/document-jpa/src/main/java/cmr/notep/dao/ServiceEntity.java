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
@Table(name = "service")
public class ServiceEntity {

    @Id
    @Column(name = "id" , nullable = false)
    private String id ;

    @Column(name = "description")
    private String description;

    @Column(name = "libelle")
    private String libelle;

    @Column(name = "localisation")
    private String localisation;

    @Column(name = "etat")
    private Boolean etat;

    @Column(name = "datecreation")
    private LocalDate datecreation;

    @Column(name = "datemodification")
    private LocalDate datemodification;

    @Column(name = "codeuniq", nullable = false , unique = true)
    private String codeunique;

    @OneToMany(mappedBy = "taches", fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("mission")
    private List<MissionsEntity> missionEntities ;
}
