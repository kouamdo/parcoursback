package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "precomouvementsqte")
public class PrecoMouvementsQteEntity{

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
    @JoinColumn(name = "id_precomouvements" , nullable = false)
    @Mapping("precoMouvement")
    private PrecoMouvementsEntity precoMouvementsEntity ;

    @OneToMany(mappedBy = "precoMouvementsQteEntity" , fetch = FetchType.LAZY)
    @Mapping("familles")
    private List<FamillesEntity> famillesEntities ;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_ressources")
    @Mapping("ressources")
    private RessourcesEntity ressourcesEntity;

}
