package cmr.notep.modele;

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


    //public List<Etats>  = new ArrayList<Etats> ();

}
