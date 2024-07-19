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
@JsonIgnoreProperties({"precoMouvementsQte","promotion"})
@ToString(exclude = {"precoMouvementsQte","promotion"})
@EqualsAndHashCode(exclude = {"precoMouvementsQte","promotion"})
public class Familles {
    private String id ;
    private String libelle;
    private String description;
    private String etat ;
    private Date dateCreation;
    private Date dateModification;
    private List<PrecoMouvementsQtes> precoMouvementsQtes;
    private List<Ressources> ressources;
    private List<Promotions> promotions;
}
