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
@Table(name = "personnels")
public class PersonnelsEntity {

    @Column(name = "dateentree")
    private Date dateEntree ;

    @Column(name = "nom")
    private String nom;

    @Column(name = "datenaissance")
    private  Date dateNaissance ;

    @Column(name = "telephone")
    private String telephone;

    @Column(name = "datesortie")
    private Date dateSortie;

    @Column(name = "email")
    private String email;

    @Column(name = "prenom")
    private String prenom;

    @Column(name = "sexe")
    private String sexe ;

    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @OneToMany(mappedBy = "personnelsEntity", fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("jouerole")
    List<JouerRolesEntity> jouerRolesEntities;
}
