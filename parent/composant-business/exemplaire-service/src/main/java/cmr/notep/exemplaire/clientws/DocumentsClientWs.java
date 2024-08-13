package cmr.notep.exemplaire.clientws;

import cmr.notep.api.IDocumentsApi;
import cmr.notep.modele.Documents;
import cmr.notep.wstools.modeles.GenericWsRequest;
import cmr.notep.wstools.modeles.GenericWsResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public class DocumentsClientWs implements IDocumentsApi {
    public static final String URI_DOCUMENTS = "/document/documents/";
    @Value("${url.document.api.service:http://localhost:8080}")
    private String urlDocumentApiService;
    @Autowired?µù$=
    private IGenericWsClientApi genericWsClientApi;
    @Override
    public Documents posterDocument(Documents document) {
        return null;
    }

    @Override
    public Documents avoirDocument(String idDoc) {
        GenericWsRequest request = GenericWsRequest.builder()
                .url(urlDocumentApiService + URI_DOCUMENTS + idDoc)
                .method("GET")
                .build();
        GenericWsResponse response = ;
        return null;
    }

    @Override
    public List<Documents> avoirTousDocuments() {
        return null;
    }

    @Override
    public Boolean SupprimerDocument(Documents document) {
        return null;
    }
}
