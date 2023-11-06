package cmr.notep.api;

import cmr.notep.modele.Documents;
import org.springframework.http.MediaType;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/documents")
public interface IDocumentApi {

    @PostMapping(
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    Documents posterDocument(@NonNull @RequestBody Documents document);

    @GetMapping(
            path = "/{idDoc}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    Documents avoirDocument(@NonNull @RequestParam(name = "idDoc") String idDoc);

    @GetMapping(
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    List<Documents> avoirTousDocuments();
    @DeleteMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    Boolean SupprimerDocument(@NonNull @RequestBody Documents document);
}
