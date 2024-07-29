package cmr.notep.exemplaire.modele;

import cmr.notep.modele.Personnels;
import cmr.notep.modele.Validations;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class EtatsValidations {
    String id;
    String methode;
    Personnels personnel;
    OrdreEtats ordreEtat;
    Validations validation;
}
