package cmr.notep.impl;

import cmr.notep.api.IPrecoMouvementsApi;
import cmr.notep.business.PrecomouvementsBusiness;
import cmr.notep.modele.PrecoMouvements;
import lombok.NonNull;

import java.util.List;

public class PrecomouvementsService implements IPrecoMouvementsApi {

    private final PrecomouvementsBusiness precomouvementbusiness ;
    public PrecomouvementsService(PrecomouvementsBusiness precomouvementbusiness) {this.precomouvementbusiness = precomouvementbusiness ;}


    @Override
    public PrecoMouvements avoirPrecomouvement(@NonNull String idPrecomouvements) {
        return precomouvementbusiness.avoirPrecomouvements(idPrecomouvements);
    }

    @Override
    public List<PrecoMouvements> avoirToutPrecomouvement() {
        return precomouvementbusiness.avoirTousPrecouvement();
    }

    @Override
    public void supprimerPrecomouvements(PrecoMouvements precoMouvements) {

    }

    @Override
    public PrecoMouvements posterPrecomouvements(@NonNull PrecoMouvements precoMouvements) {
        return precomouvementbusiness.posterPrecomouvement(precoMouvements);
    }
}
