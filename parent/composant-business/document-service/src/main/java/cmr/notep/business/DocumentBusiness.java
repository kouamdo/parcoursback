package cmr.notep.business;


import static cmr.notep.config.DocumentConfig.*;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cmr.notep.dao.DaoAccessorService;
import cmr.notep.dao.DocumentsEntity;
import cmr.notep.modele.Documents;
import cmr.notep.repository.DocumentsRepository;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
@Transactional
public class DocumentBusiness {
    private final DaoAccessorService daoAccessorService;
    

    //private final BusinessEntityHelper businessEntityHelper; , BusinessEntityHelper businessEntityHelper

    public DocumentBusiness(DaoAccessorService daoAccessorService, DocumentsRepository documentsRepository) {
        this.daoAccessorService = daoAccessorService;
        this.documentsRepository = documentsRepository;
      //  this.businessEntityHelper = businessEntityHelper;
    }

    public List<Documents> avoirTousDocuments() {
        log.debug("avoirTousDocuments called");
       return daoAccessorService.getRepository(DocumentsRepository.class).findAll()
                .stream().map(doc ->dozerMapperBean.map(doc,Documents.class))
                .collect(Collectors.toList());
    }

    /**
     * Code métier permettant d'enregistrer un nouveau document
     * @param document
     * @return
     */
    public Documents posterDocument(Documents document){
        log.debug("[posterDocument] poster un document");

        return dozerMapperBean.map(
                this.daoAccessorService.getRepository(DocumentsRepository.class)
                .save(dozerMapperBean.map(document, DocumentsEntity.class)),
                Documents.class);
    }

    public Documents avoirDocument(String idDoc) {
        log.debug("[avoirDocument] called");
        return dozerMapperBean.map(
                this.daoAccessorService.getRepository(DocumentsRepository.class)
                        .findById(idDoc)
                        .orElseThrow(()->new RuntimeException("Document non trouvé")),Documents.class);
    }
}
