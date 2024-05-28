package cmr.notep.modele;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class Associer {

    private  Attributs attribut ;

    private boolean obligatoire ;

    private int ordre ;
}
