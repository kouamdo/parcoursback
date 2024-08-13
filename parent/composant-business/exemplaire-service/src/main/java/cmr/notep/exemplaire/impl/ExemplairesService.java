package cmr.notep.exemplaire.impl;

import cmr.notep.exemplaire.api.IExemplairesApi;
import cmr.notep.exemplaire.modele.Exemplaires;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import java.util.List;
@RestController
@Transactional
public class ExemplairesService implements IExemplairesApi {
    @Override
    public Exemplaires posterExemplaire(Exemplaires exemplaire) {
        return null;
    }

    @Override
    public Exemplaires avoirExemplaire(String idExemplaire) {
        return null;
    }

    @Override
    public List<Exemplaires> avoirTousExemplaires() {
        return null;
    }

    @Override
    public Boolean SupprimerExemplaire(Exemplaires exemplaire) {
        return null;
    }
}
