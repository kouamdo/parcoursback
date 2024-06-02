package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class JouerRoles {
    private String id;
    private Boolean etat ;
    private Date dateCreation;
    private Date dateFin ;
    private Date dateDebut ;
    private Personnels personnel ;
    private Roles role ;
}
