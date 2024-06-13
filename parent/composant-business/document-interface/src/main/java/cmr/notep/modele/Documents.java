package cmr.notep.modele;


import java.util.Date;
import java.util.List;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class Documents {
    private String id;

    private String titre;

    private String description;

    private boolean etat;

    private Date datecreation;

    private Date datemodification;

    private TypeMouvement typemouvement ;

    private String afficherPrix ;

    private Boolean afficherUnite;

    private Boolean afficherdistributeur;

    private Boolean prixeditable;

    private Boolean contientressources;

    public List<Missions> missions ;

    private List<PrecoMouvements> precoMouvements ;

    private List<Attributs> attributs ;
    private List<Categories> categories ;
    private List<DocEtats> docetats;

}
