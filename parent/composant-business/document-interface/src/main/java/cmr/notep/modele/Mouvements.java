package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties({"ressource","distributeur"})
@ToString(exclude = {"ressource","distributeur"})
@EqualsAndHashCode(exclude = {"ressource","distributeur"})
public class Mouvements {
    private  String id ;
    private  String description ;
    private int qte ;
    private double prix ;
    private Date dateCreation ;
    private Date datePeremption ;
    private List<PrecoMouvements> precoMouvements;
    private Ressources ressource;
    private Distributeurs distributeur;
}
