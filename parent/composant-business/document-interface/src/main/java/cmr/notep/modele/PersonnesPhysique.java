package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PersonnesPhysique extends Personnes {
    private String nom ;
    private String prenom;
    private String sexe ;
    private Date dateNaissance ;
}