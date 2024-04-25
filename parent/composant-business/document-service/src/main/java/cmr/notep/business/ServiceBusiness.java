package cmr.notep.business;

import cmr.notep.dao.AttributsEntity;
import cmr.notep.dao.DaoAccessorService;
import cmr.notep.dao.ServiceEntity;
import cmr.notep.modele.Attributs;
import cmr.notep.modele.Service;
import cmr.notep.repository.AttributsRepository;
import cmr.notep.repository.ServiceRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

import static cmr.notep.config.DocumentConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional
public class ServiceBusiness {
    private final DaoAccessorService daoAccessorService ;

    public ServiceBusiness(DaoAccessorService daoAccessorService) {
        this.daoAccessorService = daoAccessorService;
    }

    public Service avoirService(String idService) throws Throwable {
        return dozerMapperBean.map(this.daoAccessorService.getRepository(ServiceRepository.class)
                .findById(idService)
                .orElseThrow(()-> new RuntimeException("Service introuvable")),Service.class);
    }

    public List<Service> avoirToutService() {
        return daoAccessorService.getRepository(ServiceRepository.class).findAll()
                .stream().map(service -> dozerMapperBean.map(service,Service.class))
                .collect(Collectors.toList());
    }

    public void supprimerService(Service service)
    {
        daoAccessorService.getRepository(ServiceRepository.class)
                .deleteById(service.getId());
    }

    public Service posterService(Service service) {
        return dozerMapperBean.map( this.daoAccessorService.getRepository(ServiceRepository.class)
                .save(dozerMapperBean.map(service, ServiceEntity.class)), Service.class );
    }
}
