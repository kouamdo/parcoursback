package cmr.notep.dao;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "attributs")
public class AttributsEntity {
    @Id
    //@GeneratedValue(strategy=GenerationType.AUTO)
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

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "optionnel")
    private Boolean optionnel;

    @Column(name = "valeurpardefaut")
    private String valeurpardefaut;

    @ManyToMany(mappedBy = "attributsEntities")
    @JsonIgnore
    private List<DocumentsEntity> documents;

    //@ManyToMany(mappedBy = "attributsEntities")
    //@Mapping("categories")
    //@JsonIgnore
   // private List<CategoriesEntity> categories ;

    @OneToMany(mappedBy = "attributAssocier", fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    private List<AssocierEntity> attributsAssocier ;
}