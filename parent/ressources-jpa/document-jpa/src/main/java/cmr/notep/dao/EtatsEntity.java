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
@Table(name = "etats")
public class EtatsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "libelle")
    private String libelle;

    @Column(name = "description")
    private String description;

    @Column(name = "datecreation")
    private Date dateCreation;

    @OneToMany(mappedBy = "etatsEntity")
    @Mapping("docetats")
    private List<DocEtatsEntity> docEtatsEntities;

    @OneToMany(mappedBy = "etatsEntity")
    @Mapping("ordres")
    private List<OrdreEtatsEntity> ordreEtatsEntities;
}
