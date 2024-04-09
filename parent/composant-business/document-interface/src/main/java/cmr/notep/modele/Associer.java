package cmr.notep.modele;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Associer {

    private  Attributs attributAssocier ;

    private boolean obligatoire ;

    private int ordre ;
}
