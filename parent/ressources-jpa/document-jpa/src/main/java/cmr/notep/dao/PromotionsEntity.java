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
@Table(name = "promotions")
public class PromotionsEntity {

    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "datedebut")
    private Date dateDebut;

    @Column(name = "datefin")
    private Date dateFin;

    @Column(name = "codeunique", unique = true)
    private String codeUnique;

    @Column(name = "montantremise")
    private Double montantRemise;

    @Column(name = "pourcentageremise")
    private Double pourcentageRemise;

    @Column(name = "datecreation")
    private Date dateCreation;

    @ManyToOne()
    @PrimaryKeyJoinColumn
    @Mapping("distributeursEntity")
    private DistributeursEntity distributeursEntity ;

    @OneToMany(mappedBy = "promotionsEntity" , fetch = FetchType.LAZY)
    @Mapping("ressources")
    private List<RessourcesEntity> ressourcesEntities;

    @ManyToMany
    @JoinTable(name = "famillepromotion" ,
            joinColumns = @JoinColumn(name = "promotions_id"),
            inverseJoinColumns = @JoinColumn(name = "familles_id"))
    @Mapping("familles")
    private List<FamillesEntity> famillesEntities;

    @ManyToMany
    @JoinTable(name = "documentpromotion" ,
        joinColumns = @JoinColumn(name = "promotions_id"),
        inverseJoinColumns = @JoinColumn(name = "documents_id"))
    @Mapping("documents")
    private List<DocumentsEntity> documentsEntities;
}
