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
    private AssocierEntity id = new AssocierEntity();

    @ManyToOne
    @MapsId("id_category")
    private CategoryEntity category ;

    @ManyToOne
    @MapsId("id_attribut")
    private AttributsEntity attribut ;

    private boolean obligatoire ;

    private int ordre ;
}
