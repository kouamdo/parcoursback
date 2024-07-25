package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "services")
public class ServicesEntity {

    @Id
    @GeneratedValue
    @Column(name = "id", nullable = false, updatable = false, columnDefinition = "UUID")
    private UUID id ;
    @Column(name = "description")
    private String description;
    @Column(name = "libelle")
    private String libelle;
    @Column(name = "localisation")
    private String localisation;
    @Column(name = "etat")
    private Boolean etat;
    @Column(name = "datecreation", updatable = false)
    private Date dateCreation;
    @Column(name = "datemodification")
    private Date dateModification;
    @Column(name = "codeunique", nullable = false , unique = true)
    private String codeUnique;
    @OneToMany(mappedBy = "servicesEntity", fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("missions")
    private List<MissionsEntity> missionsEntities ;

    @OneToOne
    @JoinColumn(name = "filesattentes_id" , referencedColumnName = "id")
    @Mapping("fileAttente")
    private FilesAttentesEntity filesAttentesEntity;
}
