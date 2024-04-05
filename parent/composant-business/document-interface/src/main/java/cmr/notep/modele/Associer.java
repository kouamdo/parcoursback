package cmr.notep.modele;

import lombok.*;

@Data
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
@Builder
public class Associer {

    private Categories category ;
    private  Attributs attribut ;

    private boolean obligatoire ;

    private int ordre ;
}
