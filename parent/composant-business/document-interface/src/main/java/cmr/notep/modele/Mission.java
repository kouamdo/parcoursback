package cmr.notep.modele;

import lombok.*;

import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Mission {

    private String id ;
    private String libelle ;
    private String description;
    private boolean etat ;
    private LocalDate datecreation ;
    private LocalDate dateModification ;
    private List<Documents> documentsEntities ;
    private Service taches ;
}
