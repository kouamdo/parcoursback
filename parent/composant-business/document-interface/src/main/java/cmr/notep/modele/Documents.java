package cmr.notep.modele;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    private List<Attributs> attributs;
    private List<Categories> categories ;

    //public List<Etats>  = new ArrayList<Etats> ();

}
