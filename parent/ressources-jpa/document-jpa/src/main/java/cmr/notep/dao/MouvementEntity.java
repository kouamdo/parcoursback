package cmr.notep.dao;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "mouvement")
public class MouvementEntity {

    @Column(name = "quantite")
    private int qte ;

    @Column(name = "prix")
    private int prix;

    @Column(name = "dateCreation")
    private Date dateCreation;

    @Column(name = "datePeremption")
    private Date datePeremption;

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private String id;

    @Column(name = "description")
    private String description;
}
