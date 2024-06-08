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
@Table(name = "parcours")
public class ParcoursEntity {
    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "libelle")
    private String libelle;

    @Column(name = "datecreation")
    private Date dateCreation;

    @OneToMany(mappedBy = "parcoursEntity" , fetch = FetchType.LAZY , cascade = {CascadeType.ALL})
    @Mapping("etapes")
    private List<EtapesEntity> etapesEntities;
}
