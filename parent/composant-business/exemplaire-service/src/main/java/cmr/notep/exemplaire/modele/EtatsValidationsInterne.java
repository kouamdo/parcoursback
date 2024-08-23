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
public class EtatsValidationsInterne {
    String id;
    String methode;
    String personnel;
    OrdreEtatsInterne ordreEtat;
    String validation;
}
