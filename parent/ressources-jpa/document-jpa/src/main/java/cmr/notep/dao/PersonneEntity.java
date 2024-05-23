package cmr.notep.dao;

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
@Table(name = "personne")
public class PersonneEntity
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
    private List<PersonneEntity> personneRatache = new ArrayList<>();

}
