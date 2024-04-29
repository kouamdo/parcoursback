package cmr.notep.business;

import cmr.notep.dao.DaoAccessorService;
import cmr.notep.dao.TachesEntity;
import cmr.notep.modele.Taches;
import cmr.notep.repository.TachesRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

import static cmr.notep.config.DocumentConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional
public class TachesBusiness {
    private final DaoAccessorService daoAccessorService ;

    public TachesBusiness(DaoAccessorService daoAccessorService) {
        this.daoAccessorService = daoAccessorService;
    }

    public Taches avoirTache(String idTache) throws Throwable {
        return dozerMapperBean.map(this.daoAccessorService.getRepository(TachesRepository.class)
                .findById(idTache)
                .orElseThrow(()-> new RuntimeException("Tache introuvable")),Taches.class);
    }

    public List<Taches> avoirToutTaches() {
        return daoAccessorService.getRepository(TachesRepository.class).findAll()
                .stream().map(tache -> dozerMapperBean.map(tache,Taches.class))
                .collect(Collectors.toList());
    }

    public void supprimerTache(Taches tache)
    {
        daoAccessorService.getRepository(TachesRepository.class)
                .deleteById(tache.getId());
    }

    public Taches posterTache(Taches tache) {
        return dozerMapperBean.map( this.daoAccessorService.getRepository(TachesRepository.class)
                .save(dozerMapperBean.map(tache, TachesEntity.class)), Taches.class );
    }
}
