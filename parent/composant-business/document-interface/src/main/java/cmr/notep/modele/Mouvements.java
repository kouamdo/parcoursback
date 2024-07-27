package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.util.Date;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties({"ressource","distributeur","precoMouvements","precoMouvementsRespecter","precoMouvementsVioler"})
@ToString(exclude = {"ressource","distributeur","precoMouvements","precoMouvementsRespecter","precoMouvementsVioler"})
@EqualsAndHashCode(exclude = {"ressource","distributeur","precoMouvements","precoMouvementsRespecter","precoMouvementsVioler"})
public class Mouvements {
    private String id ;
    private  String description ;
    private int quantite ;
    private double prix ;
    private Date dateCreation ;
    private Date datePeremption ;
    private Date dateModification;
    private List<PrecoMouvements> precoMouvementsRespecter;
    private List<PrecoMouvements> precoMouvementsVioler;
    private List<PrecoMouvements> precoMouvements;
    private Ressources ressource;
    private Distributeurs distributeur;
}
