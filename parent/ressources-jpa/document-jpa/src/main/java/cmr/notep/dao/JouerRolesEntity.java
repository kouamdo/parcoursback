package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "jouerroles")
public class JouerRolesEntity {

    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "etat")
    private Boolean etat ;

    @Column(name = "datecreation")
    private Date dateCreation;

    @Column(name = "datefin")
    private Date dateFin ;

    @Column(name = "datedebut")
    private Date dateDebut ;

    @ManyToOne
    @JoinColumn(name = "personnels_id")
    @Mapping("personnel")
    private PersonnelsEntity personnelsEntity;

    @ManyToOne
    @JoinColumn(name = "roles_id")
    @Mapping("role")
    private RolesEntity rolesEntity;

}
