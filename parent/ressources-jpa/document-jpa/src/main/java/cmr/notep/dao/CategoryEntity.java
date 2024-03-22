package cmr.notep.dao;

import javax.persistence.*;

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

    @ManyToMany(mappedBy = "AttribCategory")
    @Mapping("attributs")
    private List<AttributsEntity> CatAttrib ;
}
