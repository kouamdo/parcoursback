package cmr.notep.modele;

import java.time.LocalDate;
import java.util.List;

public class Ressource {
    private String id ;
    private String libelle;
    private Boolean etat;
    private LocalDate datecreation;
    private LocalDate datemodification;
    private int quantite ;
    private double prix;
    Unite unites;
    private List<PrecoMouvementsQte> precoMouvementsQteEntities;
    private Famille familleEntity;
}
