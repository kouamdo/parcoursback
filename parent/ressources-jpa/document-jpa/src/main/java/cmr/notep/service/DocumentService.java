package cmr.notep.service;

import java.util.Optional;

import cmr.notep.dao.DocumentsEntity;



public interface DocumentService {
    public Optional<DocumentsEntity> GetDocument(String Id_Document);
    public DocumentsEntity SetDocument (String Id_Document , DocumentsEntity newDocument);
    public DocumentsEntity SaveDocument(DocumentsEntity Document);
    public void DeleteDocument(String id);
}