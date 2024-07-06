package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Distributeurs extends Personnes{
    private String distributeurs_id;
    private String raisonSociale;
    private String code ;
}
