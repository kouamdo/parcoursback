package cmr.notep.api;


import cmr.notep.modele.Missions;
import cmr.notep.modele.Ressources;
import org.springframework.http.MediaType;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("ressources")
public interface IRessourcesApi {
    @GetMapping(
            path = "/{idRessource}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    Missions avoirRessources (@NonNull @RequestParam(name="idRessource") String idRessource);

    @GetMapping(
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    List<Missions> avoirToutRessources();

    @DeleteMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    void supprimerRessources(@NonNull @RequestBody Ressources ressources);

    @PostMapping(
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    Missions posterRessources(@NonNull @RequestBody Ressources ressources) ;

}
