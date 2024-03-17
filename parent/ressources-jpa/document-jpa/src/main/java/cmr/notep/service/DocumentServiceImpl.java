package cmr.notep.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import cmr.notep.dao.DocumentsEntity;
import cmr.notep.repository.DocumentsRepository;

@Service
@Transactional
public class DocumentServiceImpl implements DocumentService {

    public DocumentsRepository documentRepo ;

    @SuppressWarnings("null")
    @Override
    public Optional<DocumentsEntity> GetDocument(String Id_Document) {
        return this.documentRepo.findById(Id_Document);
    }

    @SuppressWarnings("null")
    @Override
    public DocumentsEntity SetDocument(String Id_Document, DocumentsEntity newDocument) {
        this.documentRepo.deleteById(Id_Document);
        return this.documentRepo.save(newDocument);
    }

    @SuppressWarnings("null")
    @Override
    public DocumentsEntity SaveDocument(DocumentsEntity Document) {
        return this.documentRepo.save(Document);
    }

    @SuppressWarnings("null")
    @Override
    public void DeleteDocument(String id) {
        this.documentRepo.deleteById(id);
    }
    
}
