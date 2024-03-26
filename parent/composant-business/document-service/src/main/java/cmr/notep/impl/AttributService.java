package cmr.notep.impl;

import cmr.notep.api.IAttributApi;
import cmr.notep.business.AttributBusiness;
import cmr.notep.modele.Attributs;
import cmr.notep.repository.AttributsRepository;
import lombok.NonNull;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import java.util.List;
import java.util.stream.Collectors;

import static cmr.notep.config.DocumentConfig.dozerMapperBean;

@RestController
@Transactional
public class AttributService implements IAttributApi {

    private final AttributBusiness attribBusiness ;

    public AttributService(AttributBusiness attribBusiness) {
        this.attribBusiness = attribBusiness ;
    }

    @Override
    public Attributs avoirAttribut(@NonNull String idAttribut) { return attribBusiness.avoirAttribut(idAttribut);}

    @Override
    public List<Attributs> avoirToutAttribut(){return attribBusiness.avoirToutAttribut();}

    @Override
    public void supprimerAttribut(@NonNull Attributs attrib){
        attribBusiness.supprimerAttribut(attrib);
    }

    @Override
    public Attributs posterAttribut(@NonNull Attributs attributs) {
        return attribBusiness.posterAttribut(attributs);
    }
}
