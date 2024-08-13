package cmr.notep.exemplaire.business;

import cmr.notep.api.IDocumentsApi;
import cmr.notep.dao.DaoAccessorService;
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
        return convertirExemplaireInterneEnExemplaire(exemplairesInterne);
    }

    private Exemplaires convertirExemplaireInterneEnExemplaire(ExemplairesInterne exemplairesInterne) {
        //TODO remplacer par un appel à un webservice de document
        Documents document = documentsApi.avoirDocument(exemplairesInterne.getDocumentId());
    }

}
