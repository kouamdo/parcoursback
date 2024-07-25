package cmr.notep.dao;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "personnes")
@Inheritance(strategy = InheritanceType.JOINED)
public class PersonnesEntity
{
    @Id
    @GeneratedValue
    @Column(name="id", nullable = false, updatable = false, columnDefinition = "UUID")
    private UUID id ;

    @Column(name = "adresse")
    private String adresse ;

    @Column(name = "mail")
    private String mail ;

    @Column(name = "telephone")
    private  String telephone ;

    @Column(name = "qrcodevalue")
    private  String qrcodevalue ;
    @Column(name = "datecreation")
    private Date dateCreation;
    @Column(name = "datemodification")
    private Date dateModification;

    @ManyToMany
    @JoinTable(
            name = "personneratache",
            joinColumns = @JoinColumn(name = "personne_id"),
            inverseJoinColumns = @JoinColumn(name = "personneratache_id")
    )
    @JoinColumn(referencedColumnName = "id")
    @JsonBackReference
    @Mapping("personnesratache")
    private List<PersonnesEntity> personnesratache;

}
