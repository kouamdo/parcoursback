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
@Table(name = "documents")
public class DocumentsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "titre", nullable = false)
    private String titre;

    @Column(name = "description")
    private String description;

    @Column(name = "typemouvement")
    private String typeMouvement ;

    @Column(name = "afficherprix")
    private String afficherPrix ;

    @Column(name = "etat")
    private Boolean etat;

    @Column(name = "afficherunite")
    private Boolean afficherUnite;

    @Column(name="afficherdistributeur")
    private Boolean afficherDistributeur;

    @Column(name="prixeditable")
    private Boolean prixEditable;

    @Column(name="contientressources")
    private Boolean contientRessources;

    @Column(name = "datecreation")
    private Date dateCreation;

    @Column(name = "datemodification")
    private Date dateModification;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinTable(name = "constituer",
            joinColumns = @JoinColumn(name = "id_document"),
            inverseJoinColumns = @JoinColumn(name = "id_attribut"))
    @Mapping("attributs")
    //@Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<AttributsEntity> attributsEntities ;

    @OneToMany(mappedBy = "documentsEntity", fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("categories")
    private List<CategoriesEntity> categoriesEntities;

    @ManyToMany(mappedBy = "documentsEntities")
    private List<MissionsEntity> missionsEntities ;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinTable(name = "suivre",
            joinColumns = @JoinColumn(name = "id_document"),
            inverseJoinColumns = @JoinColumn(name = "id_precomouvements"))
    @Mapping("precomouvements")
    private List<PrecoMouvementsEntity> precoMouvementsEntities ;
}