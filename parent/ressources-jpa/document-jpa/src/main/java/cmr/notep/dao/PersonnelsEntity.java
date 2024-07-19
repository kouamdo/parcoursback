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
@Table(name = "personnels")
public class PersonnelsEntity {

    @Id
    @GeneratedValue
    @Column(name = "id", nullable = false, updatable = false, columnDefinition = "UUID")
    private UUID id;
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
    @Column(name = "datemodification")
    private Date dateModification;

    @OneToMany(mappedBy = "personnelsEntity", fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("roles")
    List<JouerRolesEntity> jouerRolesEntities;
}
