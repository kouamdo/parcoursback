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
public class Remplir {
    private Roles role;
    private Missions mission;
    private Date dateFin ;
    private Date dateCreation;
    private Date dateDebut;
    private boolean etat ;
    private boolean droitAjouter;
    private boolean droitModifier;
    private boolean droitConsulter;
    private boolean droitDeValider;
}
