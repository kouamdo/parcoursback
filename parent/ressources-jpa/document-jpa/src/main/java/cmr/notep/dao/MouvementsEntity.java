package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "mouvements")
public class MouvementsEntity {

    @Id
    @Column(name = "id" , nullable = false)
    private  String id ;

    @Column(name = "description" , nullable = false)
    private  String description ;

    @Column(name = "quantite")
    private int quantite ;

    @Column(name = "prix")
    private double prix ;

    @Column(name = "datecreation",nullable = false)
    private Date dateCreation ;

    @Column(name = "dateperemption",nullable = false)
    private Date datePeremption ;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinTable(name = "respecter" ,
    joinColumns = @JoinColumn(name = "mouvements_id"),
    inverseJoinColumns = @JoinColumn(name = "precomouvements_id"))
    @Mapping("precoMouvementsRespecter")
    private List<PrecoMouvementsEntity> precoMouvementsRespecterEntityties;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinTable(name = "violer" ,
            joinColumns = @JoinColumn(name = "mouvements_id"),
            inverseJoinColumns = @JoinColumn(name = "precomouvements_id"))
    @Mapping("precoMouvementsVioler")
    private List<PrecoMouvementsEntity> precoMouvementsViolerEntityties;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ressources_id")
    @Mapping("ressource")
    private RessourcesEntity ressourcesEntity;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "distributeurs_id")
    @Mapping("distributeur")
    private DistributeursEntity distributeursEntity;
}
