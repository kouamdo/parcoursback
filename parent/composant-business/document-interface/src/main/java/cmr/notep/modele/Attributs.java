package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties({"document, categories"})
@ToString(exclude = {"documents, categories"})
@EqualsAndHashCode(exclude = {"documents, categories"})
public class Attributs {
    private String id;
    private String titre;

    private String description;

    private boolean etat;

    private Date dateCreation;

    private Date dateModification;

    Types type;
    private List<Documents> documents;
    private List<Categories> categories ;

}
