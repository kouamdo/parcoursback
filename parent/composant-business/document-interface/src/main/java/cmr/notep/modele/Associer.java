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

    private String id_category ;

    private  Attributs attribut ;

    private boolean obligatoire ;

    private int ordre ;
}
