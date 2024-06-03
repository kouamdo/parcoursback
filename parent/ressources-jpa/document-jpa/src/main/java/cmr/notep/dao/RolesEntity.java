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
@Table(name = "roles")
public class RolesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "titre")
    private String titre;

    @Column(name = "description")
    private String description;

    @Column(name = "etat")
    private Boolean etat ;

    @Column(name = "datecreation")
    private Date dateCreation;

    @OneToMany(mappedBy = "rolesEntity", fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("joueroles")
    List<JouerRolesEntity> jouerRolesEntities;

    @OneToMany(mappedBy = "rolesEntity", fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("remplirList")
    List<RemplirEntity> remplirEntities;

    @OneToMany(mappedBy = "roleEntity" , fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("validations")
    private List<ValidationsEntity> validationsEntities;
}
