package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Distributeurs {
    private String id;
    private List<Mouvement> mouvements;
    private PrecoMouvementsQtes precomouvementqte;
}
