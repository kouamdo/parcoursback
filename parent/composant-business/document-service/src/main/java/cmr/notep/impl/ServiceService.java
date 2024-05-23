package cmr.notep.impl;


import cmr.notep.api.IServiceApi;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;

@RestController
@Transactional
public class ServiceService {

//    private final ServiceBusiness ServiceBusiness ;
//
//    public ServiceService(ServiceBusiness ServiceBusiness) {
//        this.ServiceBusiness = ServiceBusiness;
//    }
//
//    @Override
//    public Service avoirService(@NonNull String idTache) throws Throwable {
//        return ServiceBusiness.avoirTache(idTache);
//    }
//
//    @Override
//    public List<Service> avoirToutService() {
//        return ServiceBusiness.avoirToutService();
//    }
//
//    @Override
//    public void supprimerService(@NonNull Service tache) {
//        ServiceBusiness.supprimerTache(tache);
//    }
//
//    @Override
//    public Service PosterService(Service tache) {
//        return ServiceBusiness.posterTache(tache);
//    }
}
