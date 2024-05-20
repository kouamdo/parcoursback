package cmr.notep.api;

import cmr.notep.modele.Documents;
import cmr.notep.modele.Famille;
import org.springframework.http.MediaType;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("famille")
public interface IFamilleApi {
    @PostMapping(
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    Documents posterFamille(@NonNull @RequestBody Famille famille);

    @GetMapping(
            path = "/{idFamille}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    Documents avoirFamille(@NonNull @RequestParam(name = "idFamille") String idFamille);

    @GetMapping(
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    List<Documents> avoirTousFamilles();
    @DeleteMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    Boolean SupprimerFamilles(@NonNull @RequestBody Famille famille);
}
