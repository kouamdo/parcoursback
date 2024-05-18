package cmr.notep.modele;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Documents {
    private String id;

    private String titre;

    private String description;

    private boolean etat;

    private Date dateCreation;

    private Date dateModification;

    private String type ;

    private String afficherPrix ;

    private Boolean afficherUnite;
    private Boolean afficherDistributeur;

    private Boolean prixEditable;

    //public List<Missions>  = new ArrayList<Missions> ();

    private List<PrecoMouvements> precomouvements = new ArrayList<>();

    private List<Attributs> attributs;
    private List<Categories> categories ;

    //public List<Etats>  = new ArrayList<Etats> ();

}
