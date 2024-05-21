package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "associer")
public class AssocierEntity {

    @EmbeddedId
    private AssocierEntityID id;

    @ManyToOne
    @MapsId("id_category")
    @JoinColumn(name = "id_category", referencedColumnName = "id_category")
    private CategoriesEntity categoryAssocier ;


    @ManyToOne
    @MapsId("id_attribut")
    @JoinColumn(name = "id_attribut", referencedColumnName = "id")
    private AttributsEntity attributAssocier ;

    @Column(name="obligatoire")
    private boolean obligatoire ;

    @Column(name="ordre")
    private int ordre ;
}
