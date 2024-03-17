package cmr.notep.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cmr.notep.dao.DocumentsEntity;
import cmr.notep.service.DocumentServiceImpl;


@RestController
@RequestMapping("/document")
public class DocumentController {
    
    @SuppressWarnings("unused")
    private DocumentServiceImpl documentService ;

    public DocumentController(DocumentServiceImpl DocumentService) {
        this.documentService = DocumentService;
    }

    @PostMapping("/save")
    public ResponseEntity<DocumentsEntity> saveDocument(@RequestBody DocumentsEntity entity) {
        try {
            DocumentsEntity docuementExist = this.documentService.SaveDocument(entity);
            return new ResponseEntity<DocumentsEntity>(docuementExist,HttpStatus.CREATED);
        } catch (Exception e) {
             return new ResponseEntity<DocumentsEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PostMapping("/update/{id}")
    public ResponseEntity<DocumentsEntity> updateDocument(@PathVariable String id,@RequestBody DocumentsEntity document)
    {
        try {
            this.documentService.SetDocument(id, document);
            return new ResponseEntity<DocumentsEntity>(HttpStatus.OK) ;
        } catch (Exception e) {
            return new ResponseEntity<DocumentsEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
       }
    }

    @PostMapping("/delete/{id}")
    public ResponseEntity<DocumentsEntity> deleteDocument(@PathVariable String id)
    {
        try {
            this.documentService.DeleteDocument(id);
            return new ResponseEntity<DocumentsEntity>(HttpStatus.OK) ;
        } catch (Exception e) {
            return new ResponseEntity<DocumentsEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
       }
    }

    @PostMapping("/find/{id}")
    public ResponseEntity<DocumentsEntity> findDocument(@PathVariable String id)
    {
        try {
            this.documentService.GetDocument(id);
            return new ResponseEntity<DocumentsEntity>(HttpStatus.OK) ;
        } catch (Exception e) {
            return new ResponseEntity<DocumentsEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
       }
    }
}
