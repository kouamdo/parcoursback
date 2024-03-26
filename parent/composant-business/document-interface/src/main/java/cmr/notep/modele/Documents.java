package cmr.notep.modele;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
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

    private List<Attributs> attributs;
    private List<Categorie> listCategories ;

    //public List<Etats>  = new ArrayList<Etats> ();

}
