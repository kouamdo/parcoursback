package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "distributeurs")
@DiscriminatorValue(value = "Distributeur")
public class DistributeursEntity extends PersonneEntity {

    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @OneToMany(mappedBy = "distributeursEntity" , fetch = FetchType.LAZY , cascade = {CascadeType.ALL})
    @Mapping("mouvements")
    private List<MouvementEntity> mouvementEntities;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "precomouvementsqtes_id")
    @Mapping("precomouvementqte")
    private PrecoMouvementsQtesEntity precoMouvementsQtesEntity;
}
