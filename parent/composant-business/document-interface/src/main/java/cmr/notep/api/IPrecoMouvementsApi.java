package cmr.notep.api;


import cmr.notep.modele.PrecoMouvements;
import org.springframework.http.MediaType;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("precomouvements")
public interface IPrecoMouvementsApi {
    @GetMapping(
            path = "/{idPrecoMouvements}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    PrecoMouvements avoirPrecomouvement (@NonNull @RequestParam(name="idPrecomouvements") String idPrecomouvements);

    @GetMapping(
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    List<PrecoMouvements> avoirToutPrecomouvement();

    @DeleteMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    void supprimerPrecomouvements(@NonNull @RequestBody PrecoMouvements precoMouvements);

    @PostMapping(
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    PrecoMouvements posterPrecomouvements(@NonNull @RequestBody PrecoMouvements precoMouvements) ;
}
