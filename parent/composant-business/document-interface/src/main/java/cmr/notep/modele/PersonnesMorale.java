package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PersonnesMorale extends Personnes{
    private String raisonsociale ;
    private String code ;
}
