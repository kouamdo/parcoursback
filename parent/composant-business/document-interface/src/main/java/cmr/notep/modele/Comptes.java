package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Comptes {
    private String id;
    private String solde ;
    private Date dateCreation ;
    private String etat ;
    private double montantDecouvertMax ;
    private String libelle ;
    private Personnes personne;
    private List<Mouvements> mouvements;
    private List<DeltaSoldes> deltasoldes;
}
