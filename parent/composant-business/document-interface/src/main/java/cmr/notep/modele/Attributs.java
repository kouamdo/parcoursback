package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import java.util.Date;
import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
@Builder
public class Attributs {
    private String id;
    private String titre;

    private String description;

    private boolean etat;

    private Date dateCreation;

    private Date dateModification;

    Types type;
    //private List<Documents> documents;
    // private List<Categories> categories ;

}
