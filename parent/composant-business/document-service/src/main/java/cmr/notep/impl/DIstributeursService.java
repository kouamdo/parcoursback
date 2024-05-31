package cmr.notep.impl;

import cmr.notep.api.IDistributeursApi;
import cmr.notep.modele.Distributeurs;

import java.util.List;

public class DIstributeursService implements IDistributeursApi {
    @Override
    public Distributeurs avoirDistributeur(String idDistributeurs) {
        return null;
    }

    @Override
    public List<Distributeurs> avoirToutDistributeur() {
        return List.of();
    }

    @Override
    public void supprimerDistributeurs(Distributeurs Distributeurs) {

    }

    @Override
    public Distributeurs posterDistributeurs(Distributeurs Distributeurs) {
        return null;
    }
}
