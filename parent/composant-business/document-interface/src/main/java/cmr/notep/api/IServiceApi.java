package cmr.notep.api;


import cmr.notep.modele.Service;
import org.springframework.http.MediaType;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("service")
public interface IServiceApi {
    @GetMapping(
            path = "/{idService}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    Service avoirTaches (@NonNull @RequestParam(name="idService") String idTache) throws Throwable;

    @GetMapping(
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    List<Service> avoirToutTaches();

    @DeleteMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    void supprimerTaches(@NonNull @RequestBody Service tache);

    @PostMapping(
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    Service PosterTaches(@NonNull @RequestBody Service tache) ;
}
