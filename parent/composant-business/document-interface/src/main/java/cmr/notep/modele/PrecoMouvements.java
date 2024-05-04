package cmr.notep.modele;

import lombok.*;

import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PrecoMouvements {

    private String id ;
    private String libelle ;
    private boolean etat ;
    private String type ;
    private LocalDate datecreation ;
    private LocalDate dateModification ;
    private List<Documents> suivreDocuments ;
    private List<PrecoMouvementsQte> precoMouvementsQte;
}
