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
public class Famille {
    private String id ;
    private String libelle;
    private String description;
    private String etat ;
    private Date dateCreation;
    private PrecoMouvementsQte precoMouvementsQteEntity;
    private List<Ressource> ressourceEntities;
}
