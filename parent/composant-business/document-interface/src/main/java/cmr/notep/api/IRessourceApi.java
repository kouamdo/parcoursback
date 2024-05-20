package cmr.notep.api;


import cmr.notep.modele.Mission;
import cmr.notep.modele.Ressource;
import org.springframework.http.MediaType;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("ressources")
public interface IRessourceApi {
    @GetMapping(
            path = "/{idRessource}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    Mission avoirRessources (@NonNull @RequestParam(name="idRessource") String idRessource);

    @GetMapping(
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    List<Mission> avoirToutRessources();

    @DeleteMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    void supprimerRessources(@NonNull @RequestBody Ressource ressource);

    @PostMapping(
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    Mission posterRessources(@NonNull @RequestBody Ressource ressource) ;

}
