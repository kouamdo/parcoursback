package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "etapes")
public class EtapesEntity {

    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "libelle")
    private String libelle;

    @Column(name = "etat")
    private String etat;

    @ManyToOne
    @JoinColumn(name = "parcours_id")
    @Mapping("parcour")
    private ParcoursEntity parcoursEntity;

    @OneToMany(mappedBy = "etapesEntity" , fetch = FetchType.LAZY ,  cascade = {CascadeType.ALL})
    @Mapping("docEtats")
    private List<DocEtatsEntity> docEtatsEntityList;

}
