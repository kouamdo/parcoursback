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
@JsonIgnoreProperties
@ToString
@EqualsAndHashCode
public class Mouvements {
    private  String id ;
    private  String description ;
    private int quantite ;
    private double prix ;
    private Date dateCreation ;
    private Date datePeremption ;
    private List<PrecoMouvements> precoMouvementsRespecter;
    private List<PrecoMouvements> precoMouvementsVioler;
    private Ressources ressource;
    private Distributeurs distributeur;
}
