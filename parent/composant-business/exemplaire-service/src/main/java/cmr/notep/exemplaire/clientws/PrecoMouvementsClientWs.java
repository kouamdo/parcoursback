package cmr.notep.exemplaire.clientws;

import cmr.notep.api.IPrecoMouvementsApi;
import cmr.notep.exceptions.ParcoursException;
import cmr.notep.exemplaire.config.ExemplaireConfig;
import cmr.notep.modele.Attributs;
import cmr.notep.modele.PrecoMouvements;
import cmr.notep.utile.serialiser.JacksonHelper;
import cmr.notep.wstools.api.IGenericWsClientApi;
import cmr.notep.wstools.modeles.GenericWsRequest;
import cmr.notep.wstools.modeles.GenericWsResponse;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public class PrecoMouvementsClientWs implements IPrecoMouvementsApi {
    public static final String URI_PRECOMOUVEMENTS = "/precomouvements/";
    private final IGenericWsClientApi genericWsClientApi;
    private final ExemplaireConfig exemplaireConfig;

    public PrecoMouvementsClientWs(IGenericWsClientApi genericWsClientApi, ExemplaireConfig exemplaireConfig) {
        this.genericWsClientApi = genericWsClientApi;
        this.exemplaireConfig = exemplaireConfig;
    }

    @Override
    public PrecoMouvements avoirPrecomouvement(String idPrecomouvement) throws ParcoursException {
        GenericWsRequest request = GenericWsRequest.builder()
                .url(exemplaireConfig.getUrlDocumentApiService() + URI_PRECOMOUVEMENTS + idPrecomouvement)
                .method("GET")
                .build();
        GenericWsResponse response = genericWsClientApi.sendRequest(request);
        if (response.getCode() == 200)
            return JacksonHelper.objetFromJson(response.getReponse(), PrecoMouvements.class);
        throw new ParcoursException("Erreur lors de la récupération  " + idPrecomouvement + " code http : " + response.getReponse() + " reponse : " + response.getReponse());

    }

    @Override
    public List<PrecoMouvements> avoirToutPrecomouvement() {
        return null;
    }

    @Override
    public void supprimerPrecomouvements(PrecoMouvements precoMouvements) {

    }

    @Override
    public PrecoMouvements posterPrecomouvements(PrecoMouvements precoMouvements) {
        return null;
    }
}
