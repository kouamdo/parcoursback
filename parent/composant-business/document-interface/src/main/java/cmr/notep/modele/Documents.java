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

    private String afficherprix ;

    private Boolean afficherunite;

    private Boolean afficherdistributeur;

    private Boolean prixeditable;

    private Boolean contientRessources;

    public List<Mission> missionsEntities = new ArrayList<> ();

    private List<PrecoMouvements> precomouvements = new ArrayList<>();

    private List<Attributs> attributs;
    private List<Categories> categories ;

    //public List<Etats>  = new ArrayList<Etats> ();

}
