package cmr.notep.modele;

import java.time.LocalDate;
import java.util.List;

public class PersonnePhysique {
    private String nom ;
    private String prenom;
    private String sexe ;
    private LocalDate dateNaissance ;
    private List<PersonnePhysique> personnesRatachees;
}
