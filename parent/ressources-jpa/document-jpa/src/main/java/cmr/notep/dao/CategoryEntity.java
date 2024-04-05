package cmr.notep.dao;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "category")
public class CategoryEntity {

    @Id
   // @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_category", nullable = false)
    private String id;

    @Column(name = "ordre")
    private String ordre;

    @Column(name = "libelle")
    private String libelle;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinTable(name = "associer",
            joinColumns = @JoinColumn(name = "id_category"),
            inverseJoinColumns = @JoinColumn(name = "id_attribut"))
    @Mapping("attributs")
    private List<AttributsEntity> attributsEntities ;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinColumn(name = "id_documents")
    @Mapping("document")
    @JsonIgnore
    private DocumentsEntity documentsEntity ;
}
