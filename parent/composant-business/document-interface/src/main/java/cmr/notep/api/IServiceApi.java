package cmr.notep.api;


import cmr.notep.modele.Mission;
import org.springframework.http.MediaType;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.*;
import cmr.notep.modele.Service;

import java.util.List;


public interface IServiceApi {
    @GetMapping(
            path = "/{idService}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    Service avoirService (@NonNull @RequestParam(name="idService") String idService) throws Throwable;

    @GetMapping(
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    List<Service> avoirToutService();

    @DeleteMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    void supprimerService(@NonNull @RequestBody Service service);

    @PostMapping(
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    Service PosterService(@NonNull @RequestBody Service service) ;
}
