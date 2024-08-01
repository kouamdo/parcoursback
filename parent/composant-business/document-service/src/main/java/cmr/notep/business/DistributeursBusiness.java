package cmr.notep.business;

import cmr.notep.dao.DistributeursEntity;
import cmr.notep.dao.DaoAccessorService;
import cmr.notep.dao.PersonnesMoralesEntity;
import cmr.notep.modele.Distributeurs;
import cmr.notep.modele.PersonnesMorale;
import cmr.notep.repository.DistributeursRepository;
import cmr.notep.repository.PersonneMoraleRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static cmr.notep.config.DocumentConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional
public class DistributeursBusiness {

    private final DaoAccessorService daoAccessorService;
    
    public DistributeursBusiness(DaoAccessorService daoAccessorService) {
        this.daoAccessorService = daoAccessorService;
    }

    public Distributeurs avoirDistributeur(String id) {
        System.out.println("Recherche de Distributeur");
        Optional<DistributeursEntity> distributeur = this.daoAccessorService.getRepository(DistributeursRepository.class)
                .findById(id);
        return distributeur.isPresent() ? dozerMapperBean.map(distributeur.get(), Distributeurs.class) : null;
    }


    public List<Distributeurs> avoirToutDistributeurs() {
        return daoAccessorService.getRepository(DistributeursRepository.class).findAll()
                .stream().map(cat ->dozerMapperBean.map(cat, Distributeurs.class))
                .collect(Collectors.toList());
    }

    public void supprimerDistributeur(Distributeurs Distributeurs)
    {
        daoAccessorService.getRepository(DistributeursRepository.class)
                .deleteById(Distributeurs.getId().toString());
    }

    public Distributeurs posterDistributeur(Distributeurs Distributeurs) {
        return dozerMapperBean.map( this.daoAccessorService.getRepository(DistributeursRepository.class)
                .save(dozerMapperBean.map(Distributeurs, DistributeursEntity.class)), Distributeurs.class);
    }
}
