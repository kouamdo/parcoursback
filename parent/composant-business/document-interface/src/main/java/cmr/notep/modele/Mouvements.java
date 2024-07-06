package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
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
