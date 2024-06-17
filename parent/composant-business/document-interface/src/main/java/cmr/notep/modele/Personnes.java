package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Personnes {
    private String id ;
    private String adresse ;
    private String mail ;
    private  String telephone ;
    private  String qrcodevalue ;
    private List<Personnes> personneRatache = new ArrayList<>();
}
