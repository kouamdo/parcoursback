package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "mouvement")
public class MouvementEntity {

    @Id
    @Column(name = "id" , nullable = false)
    private  String id ;

    @Column(name = "description" , nullable = false)
    private  String description ;

    @Column(name = "quantite")
    private int qte ;

    @Column(name = "prix")
    private double prix ;

    @Column(name = "datecreation",nullable = false)
    private LocalDate dateCreation ;

    @Column(name = "dateperemption",nullable = false)
    private LocalDate datePeremption ;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinTable(name = "mouvpreco" ,
    joinColumns = @JoinColumn(name = "id_precomouvements"),
    inverseJoinColumns = @JoinColumn(name = "id_mouvement"))
    @Mapping("precomouvements")
    private List<PrecoMouvementsEntity> precoMouvementsEntityList;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_ressources")
    @Mapping("ressources")
    private RessourcesEntity ressourcesEntity;
}
