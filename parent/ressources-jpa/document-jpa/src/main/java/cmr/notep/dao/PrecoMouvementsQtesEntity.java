package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "precomouvementsqtes")
public class PrecoMouvementsQtesEntity {
    @Id
    @Column(name="id", nullable = false)
    private String id ;
    @Column(name ="qtemin")
    private int qteMin ;
    @Column(name ="qtemax")
    private int qteMax ;
    @Column(name =  "montantmin")
    private int montantMin ;
    @Column(name = "montantmax")
    private int montantMax ;
    @ManyToOne
    @JoinColumn(name = "precoMouvements_id" , nullable = false)
    @Mapping("precoMouvement")
    private PrecoMouvementsEntity precoMouvementsEntity ;

    @ManyToMany(mappedBy = "precoMouvementsQtesEntities", fetch = FetchType.LAZY)
    @Mapping("familles")
    private List<FamillesEntity> famillesEntities ;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ressources_id")
    @Mapping("ressources")
    private RessourcesEntity ressourcesEntity;

    @ManyToMany(mappedBy = "precoMouvementsQtesEntities" , fetch = FetchType.LAZY)
    @Mapping("distributeurs")
    private List<DistributeursEntity> distributeursEntities;
}
