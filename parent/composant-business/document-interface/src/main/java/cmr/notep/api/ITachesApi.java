package cmr.notep.api;


import cmr.notep.modele.Mission;
import cmr.notep.modele.Taches;
import org.springframework.http.MediaType;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.*;

import java.util.List;


public interface ITachesApi {
    @GetMapping(
            path = "/{idService}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    Taches avoirTaches (@NonNull @RequestParam(name="idService") String idTache) throws Throwable;

    @GetMapping(
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    List<Taches> avoirToutTaches();

    @DeleteMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    void supprimerTaches(@NonNull @RequestBody Taches tache);

    @PostMapping(
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    Taches PosterTaches(@NonNull @RequestBody Taches tache) ;
}
