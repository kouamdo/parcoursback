package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PersonnesPhysique {
    private String nom ;
    private String prenom;
    private String sexe ;
    private LocalDate dateNaissance ;
}
