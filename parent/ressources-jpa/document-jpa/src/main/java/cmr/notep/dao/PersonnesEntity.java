package cmr.notep.dao;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "personnes")
@Inheritance(strategy = InheritanceType.JOINED)
public class PersonnesEntity
{
    @Id
    @Column(name="id", nullable = false)
    private String id ;

    @Column(name = "adresse")
    private String adresse ;

    @Column(name = "mail")
    private String mail ;

    @Column(name = "telephone")
    private  String telephone ;

    @Column(name = "qrcodevalue")
    private  String qrcodevalue ;

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
