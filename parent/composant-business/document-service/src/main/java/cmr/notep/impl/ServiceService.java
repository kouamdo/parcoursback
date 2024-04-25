package cmr.notep.impl;


import cmr.notep.api.IServiceApi;
import cmr.notep.business.ServiceBusiness;
import cmr.notep.modele.Service;
import lombok.NonNull;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@Transactional
public class ServiceService implements IServiceApi {

    private final ServiceBusiness servicebusiness ;

    public ServiceService(ServiceBusiness servicebusiness) {
        this.servicebusiness = servicebusiness;
    }

    @Override
    public Service avoirService(@NonNull String idService) throws Throwable {
        return servicebusiness.avoirService(idService);
    }

    @Override
    public List<Service> avoirToutService() {
        return servicebusiness.avoirToutService();
    }

    @Override
    public void supprimerService(@NonNull Service service) {
        servicebusiness.supprimerService(service);
    }

    @Override
    public Service PosterService(@NonNull Service service) {
        return servicebusiness.posterService(service);
    }
}
