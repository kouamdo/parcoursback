package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "ordreetats")
public class OrdreEtatsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "datecreation")
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
