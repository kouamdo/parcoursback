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
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_category", nullable = false)
    private String id_category;

    @Column(name = "ordre")
    private String ordre;

    @Column(name = "libelle")
    private String libelle;

    @ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    @JoinTable(name = "associer",
            joinColumns = @JoinColumn(name = "id_attribut"),
            inverseJoinColumns = @JoinColumn(name = "id_category"))
    @Mapping("attributs")
    private List<AttributsEntity> attributs ;

    @ManyToOne
    @JoinColumn(name = "id_documents" , nullable = false)
    @JsonIgnore
    private DocumentsEntity document ;

}
