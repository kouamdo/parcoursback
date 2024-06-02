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
    @Mapping("jouerole")
    List<JouerRolesEntity> jouerRolesEntities;
}
