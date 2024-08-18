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
public class Exemplaires {
    private String id;
    private List<DeltaSoldes> deltasoldes;
    private List<Mouvements> mouvements;
    private Personnes personne;
}
