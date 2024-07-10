package cmr.notep.modele;

import java.util.Date;
import java.util.List;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties({"precoMouvementsQte"})
@ToString(exclude = {"precoMouvementsQte"})
@EqualsAndHashCode(exclude = {"precoMouvementsQte"})
public class Familles {
    private String id ;
    private String libelle;
    private String description;
    private String etat ;
    private Date dateCreation;
    private Date dateModification;
    private List<PrecoMouvementsQtes> precoMouvementsQte;
    private List<Ressources> ressources;
    private Promotions promotion;
}
