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

    @Column(name ="qteMin")
    private int qteMin ;

    @Column(name ="qteMax")
    private int qteMax ;

    @Column(name =  "montantMin")
    private int montantMin ;

    @Column(name = "montantMax")
    private int montantMax ;

    @ManyToOne
    @JoinColumn(name = "id_precomouvements" , nullable = false)
    @Mapping("precomouvements")
    private PrecoMouvementsEntity precoMouvementsEntity ;

    @OneToMany(mappedBy = "precoMouvementsQteEntity" , fetch = FetchType.LAZY)
    @Mapping("familles")
    private List<FamilleEntity> familleEntities ;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_ressources")
    @Mapping("ressources")
    private RessourceEntity ressourceEntity;

}
