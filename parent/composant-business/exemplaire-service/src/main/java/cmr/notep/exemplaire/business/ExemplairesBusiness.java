package cmr.notep.exemplaire.business;

import cmr.notep.api.IDocumentsApi;
import cmr.notep.dao.DaoAccessorService;
import cmr.notep.exceptions.ParcoursException;
import cmr.notep.exemplaire.modele.Exemplaires;
import cmr.notep.exemplaire.modele.ExemplairesInterne;
import cmr.notep.exemplaire.repository.ExemplairesRepository;
import cmr.notep.modele.Documents;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import static cmr.notep.exemplaire.config.ExemplaireConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional
public class ExemplairesBusiness {
    private final DaoAccessorService daoAccessorService ;
    private final IDocumentsApi documentsApi;

    public ExemplairesBusiness(DaoAccessorService daoAccessorService, IDocumentsApi documentsApi) {
        this.daoAccessorService = daoAccessorService;
        this.documentsApi = documentsApi;
    }
    public ExemplairesInterne avoirExemplaireInterne(String idExemplaire) {
        return dozerMapperBean.map(this.daoAccessorService.getRepository(ExemplairesRepository.class)
                .findById(idExemplaire)
                .orElseThrow(()-> new RuntimeException("Attribut introuvable")), ExemplairesInterne.class);
    }
    public Exemplaires avoirExemplaire(String idExemplaire) {
        ExemplairesInterne exemplairesInterne = avoirExemplaireInterne(idExemplaire);
        try {
            return convertirExemplaireInterneEnExemplaire(exemplairesInterne);
        } catch (ParcoursException e) {
            throw new RuntimeException(e);
        }
    }

    private Exemplaires convertirExemplaireInterneEnExemplaire(ExemplairesInterne exemplairesInterne) throws ParcoursException {
        Documents document = documentsApi.avoirDocument(exemplairesInterne.getDocumentId());
        Exemplaires exemplaire = (Exemplaires) document;

        exemplaire.setId(exemplairesInterne.getId());
        exemplaire.setCode(exemplairesInterne.getCode());
        exemplaire.setCodeBarre(exemplairesInterne.getCodeBarre());
        exemplaire.setTitre(exemplairesInterne.getTitre());
        exemplaire.setIdExemplairesParents(exemplairesInterne.getIdExemplairesParents());
        exemplaire.setDateCreation(exemplairesInterne.getDateCreation());
        exemplaire.setDateModification(exemplairesInterne.getDateModification());
        exemplaire.setPersonneBeneficiaire(document.getPersonneBeneficiaire());
        exemplaire.setPersonneRattachee(document.getPersonneRattachee());
        exemplaire.setOrdreEtats(document.getOrdreEtats());
        exemplaire.setMouvements(document.getMouvements());
        exemplaire.setPersonnesDestinataires(document.getPersonnesDestinataires());
        exemplaire.setExemplaireAttributs(document.getExemplaireAttributs());

        return exemplaire;
    }

}
