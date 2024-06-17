package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Promotions {

    private String id;
    private Date dateDebut;
    private Date dateFin;
    private String codeUnique;
    private Double montantRemise;
    private Double pourcentageRemise;
    private Date dateCreation;
    private Distributeurs distributeur;
    private List<Ressources> ressources;
    private List <Familles> familles;
    private List<Documents> documents;
}
