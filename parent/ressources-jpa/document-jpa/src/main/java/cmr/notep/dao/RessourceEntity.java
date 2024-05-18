package cmr.notep.dao;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "ressources")
public class RessourceEntity {
    @Id
    @Column(name = "id" , nullable = false)
    private String id ;

    @Column(name = "libelle")
    private String libelle;

    @Column(name = "etat")
    private Boolean etat;

    @Column(name = "datecreation")
    private LocalDate datecreation;

    @Column(name = "datemodification")
    private LocalDate datemodification;

    @Column(name = "quantite")
    private int quantite ;

    @Column(name = "prix")
    private double prix;

    @Column(name = "unite")
    private Unite unite ;

    @OneToMany(mappedBy = "ressourceEntity" , fetch = FetchType.LAZY)
    @Mapping("precomouvementsqte")
    private List<PrecoMouvementsQteEntity> precoMouvementsQteEntityList;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_familles")
    @Mapping("familles")
    private FamilleEntity familleEntity ;

}
