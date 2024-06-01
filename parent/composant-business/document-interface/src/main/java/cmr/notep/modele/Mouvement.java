package cmr.notep.modele;

import java.time.LocalDate;
import java.util.List;

public class Mouvement {
    private  String id ;
    private  String description ;
    private int qte ;
    private double prix ;
    private LocalDate dateCreation ;
    private LocalDate datePeremption ;
    private List<PrecoMouvements> precoMouvements;
    private Ressources ressource;
    private Distributeurs distributeur;
}
