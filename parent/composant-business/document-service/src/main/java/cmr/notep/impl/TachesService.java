package cmr.notep.impl;


import cmr.notep.api.ITachesApi;
import cmr.notep.business.TachesBusiness;
import cmr.notep.modele.Taches;
import lombok.NonNull;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@Transactional
public class TachesService {

//    private final TachesBusiness tachesBusiness ;
//
//    public TachesService(TachesBusiness tachesBusiness) {
//        this.tachesBusiness = tachesBusiness;
//    }
//
//    @Override
//    public Taches avoirTaches(@NonNull String idTache) throws Throwable {
//        return tachesBusiness.avoirTache(idTache);
//    }
//
//    @Override
//    public List<Taches> avoirToutTaches() {
//        return tachesBusiness.avoirToutTaches();
//    }
//
//    @Override
//    public void supprimerTaches(@NonNull Taches tache) {
//        tachesBusiness.supprimerTache(tache);
//    }
//
//    @Override
//    public Taches PosterTaches(Taches tache) {
//        return tachesBusiness.posterTache(tache);
//    }
}
