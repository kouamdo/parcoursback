package cmr.notep.exemplaire.dao;

import lombok.*;
import org.dozer.Mapping;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "exemplaires", schema = "exemplaire")
public class ExemplairesEntity {
    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id", nullable = false, updatable = false, columnDefinition = "UUID")
    private String id;
    @Column(name = "code")
    private String code;
    @Column(name = "codebarre")
    private String codeBarre;
    @Column(name = "titre")
    private String titre;
    //liste des id des exemplaires qui ont servi à la creation de cet exemplaire
    @ElementCollection
    @CollectionTable(name = "exemplairesparents", joinColumns = @JoinColumn(name = "exemplaires_id"))
    @Column(name = "id")
    private List<String> idExemplairesParents;
    @Column(name = "datecreation", updatable = false,nullable = false)
    private Date dateCreation;
    @Column(name = "datemodification")
    private Date dateModification;
    private String personneRattachee;
    @OneToMany(mappedBy = "exemplaireEntity")
    @Mapping("ordreEtats")
    private List<OrdreEtatsEntity> ordreEtats;
    @OneToMany(mappedBy = "exemplaireEntity")
    @Mapping("mouvements")
    private List<MouvementsEntity> mouvementsEntities;
    @ElementCollection
    @CollectionTable(name = "exemplairespersonnes", joinColumns = @JoinColumn(name = "exemplaires_id"))
    @Column(name = "personneid")
    @Mapping("personnesDestinataires")
    private List<PersonnesDestinatairesEntity> personnesDestinatairesEntities;
    @ElementCollection
    @CollectionTable(name = "exemplairesattributs", joinColumns = @JoinColumn(name = "exemplaires_id"))
    @Column(name = "attributsid")
    @Mapping("exemplaireAttributs")
    private List<ExemplaireAttributsEntity> exemplaireAttributsEntities;
}
