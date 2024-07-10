package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.util.List;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties({"distributeur","documents"})
@ToString(exclude = {"distributeur","documents"})
@EqualsAndHashCode(exclude = {"distributeur","documents"})
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
