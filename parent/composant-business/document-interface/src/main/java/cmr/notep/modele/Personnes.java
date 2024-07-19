package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties({"precomouvementsqtes","personnesratache","promotion"})
@ToString(exclude = {"precomouvementsqtes","personnesratache","promotion"})
@EqualsAndHashCode(exclude = {"precomouvementsqtes","personnesratache","promotion"})
public class Personnes {
    private String id ;
    private String adresse ;
    private String mail ;
    private  String telephone ;
    private  String qrcodevalue ;
    private List<Mouvements> mouvements;
    private List<PrecoMouvementsQtes> precomouvementsqtes;
    private Promotions promotion;
    private List<Personnes> personnesratache;
}
