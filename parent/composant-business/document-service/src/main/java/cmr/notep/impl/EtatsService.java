package cmr.notep.impl;

import cmr.notep.api.IEtatsApi;
import cmr.notep.exceptions.ParcoursException;
import cmr.notep.modele.Etats;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@Transactional
public class EtatsService implements IEtatsApi {
    @Override
    public Etats posterEtat(Etats Etat) {
        return null;
    }

    @Override
    public Etats avoirEtat(String idEtat) throws ParcoursException {
        return this.avoirEtat(idEtat);
    }

    @Override
    public List<Etats> avoirTousEtats() {
        return null;
    }

    @Override
    public void SupprimerEtat(Etats Etat) {

    }
}
