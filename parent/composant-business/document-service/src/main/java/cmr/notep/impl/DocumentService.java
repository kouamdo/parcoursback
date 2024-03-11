package cmr.notep.impl;

import cmr.notep.api.IDocumentApi;
import cmr.notep.business.DocumentBusiness;
import cmr.notep.modele.Documents;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@Transactional
public class DocumentService implements IDocumentApi {

    private final DocumentBusiness documentBusiness;
    public DocumentService(DocumentBusiness documentBusiness) {
        Assert.notNull(documentBusiness,"le composant documentBusiness est obligatoire");
        this.documentBusiness = documentBusiness;
    }

    @Override
    public Documents posterDocument(@NonNull  Documents document) {
        return documentBusiness.posterDocument(document);
    }

    @Override
    public Documents avoirDocument(@NonNull String idDoc) {
        return null;
    }

    @Override
    public List<Documents> avoirTousDocuments() {
        return documentBusiness.avoirTousDocuments();
    }

    @Override
    public Boolean SupprimerDocument(@NonNull Documents document) {
        return null;
    }
}
