package cmr.notep.dao;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "categories")
public class CategoriesEntity {

    @Id
   // @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private String id;
    @Column(name = "ordre")
    private String ordre;
    @Column(name = "libelle")
    private String libelle;
    @Column(name = "datecreation")
    private Date dateCreation;
    @Column(name = "datemodification")
    private Date dateModification;

   /* @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinTable(name = "associer",
            joinColumns = @JoinColumn(name = "id_category"),
            inverseJoinColumns = @JoinColumn(name = "id_attribut"))
    @Mapping("attributs")
    private List<AttributsEntity> attributsEntities ;*/

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinColumn(name = "documents_id")
    @Mapping("document")
    @JsonIgnore
    private DocumentsEntity documentsEntity ;

    @OneToMany(mappedBy = "categorie", fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @Mapping("associer_attributs")
    private List<AssocierEntity> attributsEntities;
}
