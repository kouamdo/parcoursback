package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Personnels {
    private String id;
    private Date dateEntree ;
    private String nom;
    private  Date dateNaissance ;
    private String telephone;
    private Date dateSortie;
    private String email;
    private String prenom;
    private String sexe ;
    private List<JouerRoles> jouerole;
}
