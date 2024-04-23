package cmr.notep.api;


import cmr.notep.modele.Attributs;
import cmr.notep.modele.Mission;
import org.springframework.http.MediaType;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.*;

import java.util.List;

public interface IMissionApi {
    @GetMapping(
            path = "/{idMission}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    Mission avoirMission (@NonNull @RequestParam(name="idMission") String idMission);

    @GetMapping(
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    List<Mission> avoirToutAttribut();

    @DeleteMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    void supprimerMission(@NonNull @RequestBody Mission missions);

    @PostMapping(
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    Mission posterMission(@NonNull @RequestBody Mission mission) ;
}
