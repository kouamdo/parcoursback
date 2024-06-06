package cmr.notep.modele;

import java.util.ArrayList;
import java.util.List;

public class Personnes {
    private String id ;
    private String adresse ;
    private String mail ;
    private  String telephone ;
    private  String qrcodevalue ;
    private List<Personnes> personneRatache = new ArrayList<>();
}
