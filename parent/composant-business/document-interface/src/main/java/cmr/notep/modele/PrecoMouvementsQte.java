package cmr.notep.modele;

import lombok.*;

import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PrecoMouvementsQte {
    private String id ;
    private int qteMin ;
    private int qteMax ;
    private int montantMin ;
    private int montantMax ;
    private PrecoMouvements precoMouvements ;
}
