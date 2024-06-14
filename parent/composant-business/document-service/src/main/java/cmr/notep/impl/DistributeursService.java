package cmr.notep.impl;

import cmr.notep.api.IDistributeursApi;
import cmr.notep.business.DistributeursBusiness;
import cmr.notep.modele.Distributeurs;

import java.util.List;

public class DistributeursService implements IDistributeursApi {

    private final DistributeursBusiness distributeursBusiness ;

    public DistributeursService(DistributeursBusiness distributeursBusiness) {
        this.distributeursBusiness = distributeursBusiness;
    }

    @Override
    public Distributeurs avoirDistributeur(String idDistributeurs) {
        return distributeursBusiness.avoirDistributeur(idDistributeurs);
    }

    @Override
    public List<Distributeurs> avoirToutDistributeur() {
        return distributeursBusiness.avoirToutDistributeurs();
    }

    @Override
    public void supprimerDistributeurs(Distributeurs Distributeurs) {
            distributeursBusiness.supprimerDistributeur(Distributeurs);
    }

    @Override
    public Distributeurs posterDistributeurs(Distributeurs Distributeurs) {
        return distributeursBusiness.posterDistributeur(Distributeurs);
    }
}
