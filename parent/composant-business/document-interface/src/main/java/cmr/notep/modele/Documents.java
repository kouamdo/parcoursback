package cmr.notep.modele;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonIncludeProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Documents {
    private String id;

    private String titre;

    private String description;

    private boolean etat;

    private Date dateCreation;

    private Date dateModification;

    //public List<Missions>  = new ArrayList<Missions> ();

    //public List<PrecoMouvements>  = new ArrayList<PrecoMouvements> ();
   // @JsonManagedReference(value = "document-attribut")
    private List<Attributs> attributs;
    //@JsonBackReference(value = "document-category")
    private List<Categories> categories ;

    //public List<Etats>  = new ArrayList<Etats> ();

}
