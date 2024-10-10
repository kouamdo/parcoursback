package cmr.notep.exemplaire.modele;

import cmr.notep.modele.Etats;
import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class OrdreEtatsInterne {
    private String id;
    private Date dateCreation;
    private Date dateModification;
    private Date dateFinVote;
    private int ordre ;
    private String etat;
    private List<EtatsValidationsInterne> etatsValidations;
}
