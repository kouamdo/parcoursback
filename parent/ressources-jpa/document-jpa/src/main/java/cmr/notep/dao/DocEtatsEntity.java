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
@Table(name = "docetats")
public class DocEtatsEntity {

    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "ordre")
    private int ordre;

    @Column(name = "datecreation")
    private Date dateCreation ;

    @ManyToOne
    @JoinColumn(name = "validations_id")
    @Mapping("validation")
    private ValidationsEntity validationsEntity;

    @OneToMany
    @Mapping("predecesseurDocEtat")
    private List<DocEtatsEntity> predecesseursDocEtat;

    @ManyToOne
    @JoinColumn(name = "etats_id")
    @Mapping("etat")
    private EtatsEntity etatsEntity;

    @ManyToOne
    @JoinColumn(name = "documents_id")
    @Mapping("document")
    private DocumentsEntity documentsEntity;

    @ManyToOne
    @JoinColumn(name = "etapes_id")
    @Mapping("etape")
    private EtapesEntity etapesEntity;

}
