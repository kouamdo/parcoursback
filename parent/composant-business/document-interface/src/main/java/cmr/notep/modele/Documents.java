package cmr.notep.modele;


import java.util.Date;
import java.util.List;
import java.util.UUID;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class Documents {
    private UUID id;

    private String titre;

    private String description;

    private boolean etat;

    private Date dateCreation;

    private Date dateModification;

    private TypeMouvement typeMouvement ;

    private String afficherPrix ;

    private Boolean afficherUnite;

    private Boolean afficherDistributeur;

    private Boolean prixEditable;

    private Boolean contientRessources;

    public List<Missions> missions ;

    private List<PrecoMouvements> precoMouvements ;

    private List<Attributs> attributs ;
    private List<Categories> categories ;
    private List<DocEtats> docEtats;
    private List<Promotions> promotions;
}
