package cmr.notep.business;

import cmr.notep.dao.DaoAccessorService;
import cmr.notep.dao.ServiceEntity;
import cmr.notep.modele.Service;
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

    public Service avoirTache(String idTache) throws Throwable {
        return dozerMapperBean.map(this.daoAccessorService.getRepository(ServiceRepository.class)
                .findById(idTache)
                .orElseThrow(()-> new RuntimeException("Tache introuvable")), Service.class);
    }

    public List<Service> avoirToutService() {
        return daoAccessorService.getRepository(ServiceRepository.class).findAll()
                .stream().map(tache -> dozerMapperBean.map(tache, Service.class))
                .collect(Collectors.toList());
    }

    public void supprimerTache(Service tache)
    {
        daoAccessorService.getRepository(ServiceRepository.class)
                .deleteById(tache.getId());
    }

    public Service posterTache(Service tache) {
        return dozerMapperBean.map( this.daoAccessorService.getRepository(ServiceRepository.class)
                .save(dozerMapperBean.map(tache, ServiceEntity.class)), Service.class );
    }
}
