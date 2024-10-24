package cmr.notep.exemplaire.modele;

import cmr.notep.modele.Etats;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString(exclude = {"exemplaire"})
@EqualsAndHashCode(exclude = {"exemplaire"})
@JsonIgnoreProperties(value = {"exemplaire"})
public class OrdreEtatsInterne {
    private String id;
    private Date dateCreation;
    private Date dateModification;
    private Date dateFinVote;
    private int ordre ;
    private String etat;
    private List<EtatsValidationsInterne> etatsValidations;
    private ExemplairesInterne exemplaire;
}
