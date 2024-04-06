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
    private AssoicierEntityID id = new AssocierEntity().getId();

    @ManyToOne
    @MapsId("listAssociation")
//    @JoinColumn(name = "category_id" refe = "id_category")
    private CategoryEntity category ;


    @ManyToOne
    @MapsId("attributAssociation")
//    @JoinColumn(name = "attribut_id" referencedColumnName = "id")
    private AttributsEntity attribut ;

    @Column(name="obligatoire")
    private boolean obligatoire ;

    @Column(name="ordre")
    private int ordre ;
}
