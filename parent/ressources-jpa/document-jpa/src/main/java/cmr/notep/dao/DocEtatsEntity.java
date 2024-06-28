package cmr.notep.dao;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "docetats")
public class DocEtatsEntity {

    @Id
    @GeneratedValue
    @Column(name = "id", nullable = false, updatable = false, columnDefinition = "UUID")
    private UUID id;
    @Column(name = "ordre")
    private int ordre;
    @Column(name = "datecreation", updatable = false)
    private Date dateCreation ;
    @Column(name = "datemodification")
    private Date dateModification;

    @ManyToOne
    @JoinColumn(name = "validations_id")
    @Mapping("validation")
    private ValidationsEntity validationsEntity;

    @OneToMany(mappedBy = "docEtatsCourantEntity", fetch = FetchType.LAZY)
    @Mapping("predecesseurDocEtat")
    private List<DocEtatsEntity> predecesseursDocEtat = new ArrayList<>();

    @ManyToOne
    @JoinColumn(referencedColumnName = "docEtatsCourantEntity_id")
    private DocEtatsEntity docEtatsCourantEntity;

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
