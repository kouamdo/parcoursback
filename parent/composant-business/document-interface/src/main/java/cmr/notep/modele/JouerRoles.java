package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties({"role","personnel"})
@ToString(exclude = {"role","personnel"})
@EqualsAndHashCode(exclude = {"role","personnel"})
public class JouerRoles {
    private String id;
    private Boolean etat ;
    private Date dateCreation;
    private Date dateFin ;
    private Date dateDebut ;
    private Personnels personnel ;
    private Roles role ;
}
