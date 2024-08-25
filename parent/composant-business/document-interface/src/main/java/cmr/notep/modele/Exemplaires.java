package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties({"personne"})
@ToString(exclude = {"personne"})
@EqualsAndHashCode(exclude = {"personne"})
public class Exemplaires {
    private String id;
    private List<DeltaSoldes> deltasoldes;
    private List<MouvementCaisses> mouvementcaisses;
    private Personnes personne;
}
