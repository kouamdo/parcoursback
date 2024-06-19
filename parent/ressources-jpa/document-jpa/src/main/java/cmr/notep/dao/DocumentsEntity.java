package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
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

    @Column(name = "etat")
    private Boolean etat;

    @Column(name = "datecreation")
    private Date dateCreation;

    @Column(name = "datemodification")
    private Date dateModification;

    @Column(name = "typemouvement")
    private String typeMouvement ;

    @Column(name = "afficherprix")
    private String afficherPrix ;

    @Column(name = "afficherunite")
    private Boolean afficherUnite;

    @Column(name="afficherdistributeur")
    private Boolean afficherDistributeur;

    @Column(name="prixeditable")
    private Boolean prixEditable;

    @Column(name="contientressources")
    private Boolean contientRessources;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinTable(name = "constituer",
            joinColumns = @JoinColumn(name = "documents_id"),
            inverseJoinColumns = @JoinColumn(name = "attributs_id"))
    @Mapping("attributs")
    //@Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<AttributsEntity> attributsEntities ;

    @OneToMany(mappedBy = "documentsEntity", fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("categories")
    private List<CategoriesEntity> categoriesEntities;

    @ManyToMany(mappedBy = "documentsEntities")
    @Mapping("missions")
    private List<MissionsEntity> missionsEntities ;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinTable(name = "suivre",
            joinColumns = @JoinColumn(name = "documents_id"),
            inverseJoinColumns = @JoinColumn(name = "precomouvements_id"))
    @Mapping("precoMouvements")
    private List<PrecoMouvementsEntity> precoMouvementsEntities ;

    @OneToMany(mappedBy = "documentsEntity" , fetch = FetchType.LAZY , cascade = {CascadeType.ALL})
    @Mapping("docEtats")
    private List<DocEtatsEntity> docEtatsEntities;

    @ManyToMany(mappedBy = "documentsEntities")
    @Mapping("promotions")
    private List<PromotionsEntity> promotionsEntities;
}