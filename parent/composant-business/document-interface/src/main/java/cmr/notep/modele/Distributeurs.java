package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Distributeurs extends Personnes {
    private String raisonSociale;
    private String code ;
    private List<Mouvements> mouvements;
    private List<PrecoMouvementsQtes> precomouvementsqtes;
    private List<Promotions> promotions;
}