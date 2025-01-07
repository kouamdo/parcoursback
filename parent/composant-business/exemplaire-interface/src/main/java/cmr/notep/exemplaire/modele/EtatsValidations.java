package cmr.notep.exemplaire.modele;

import cmr.notep.modele.Personnels;
import cmr.notep.modele.Validations;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString(exclude = {"ordreEtat"})
@EqualsAndHashCode(exclude = {"ordreEtat"})
@JsonIgnoreProperties({"ordreEtat"})
public class EtatsValidations {
    String id;
    String methode;
    Personnels personnel;
    OrdreEtats ordreEtat;
    Validations validation;
}
