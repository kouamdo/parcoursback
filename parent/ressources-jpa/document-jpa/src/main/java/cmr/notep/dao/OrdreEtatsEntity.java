package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "ordreetats")
public class OrdreEtatsEntity {
    @Id
    @GeneratedValue
    @Column(name = "id",nullable = false, updatable = false, columnDefinition = "UUID")
    private UUID id;

    @Column(name = "datecreation", updatable = false)
    private Date dateCreation;
    @Column(name = "datemodification")
    private Date dateModification;
    @Column(name = "datefinvote")
    private Date dateFinVote;
    @Column(name = "ordre")
    private int ordre ;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinColumn(name = "etats_id")
    @Mapping("etat")
    private EtatsEntity etatsEntity;
}
