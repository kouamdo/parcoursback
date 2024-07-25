package cmr.notep.business;

import cmr.notep.dao.DaoAccessorService;
import cmr.notep.dao.PersonnesEntity;
import cmr.notep.modele.Personnes;
import cmr.notep.repository.PersonnesRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

import static cmr.notep.config.DocumentConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional
public class PersonnesBusiness {
    private final DaoAccessorService daoAccessorService;

    public PersonnesBusiness(DaoAccessorService daoAccessorService) {
        this.daoAccessorService = daoAccessorService;
    }

    public Personnes avoirPersonne(String id) {
        return dozerMapperBean.map(
                this.daoAccessorService.getRepository(PersonnesRepository.class)
                        .findById(id)
                        .orElseThrow(()->new RuntimeException("Categorie inexistante")), Personnes.class);
    }

    public List<Personnes> avoirToutPersonnes() {
        return daoAccessorService.getRepository(PersonnesRepository.class).findAll()
                .stream().map(personne ->dozerMapperBean.map(personne, Personnes.class))
                .collect(Collectors.toList());
    }

    public void supprimerPersonne(Personnes Personnes)
    {
        daoAccessorService.getRepository(PersonnesRepository.class)
                .deleteById(Personnes.getId().toString());
    }

    public Personnes posterPersonne(Personnes Personnes) {
        return dozerMapperBean.map( this.daoAccessorService.getRepository(PersonnesRepository.class)
                .save(dozerMapperBean.map(Personnes, PersonnesEntity.class)), Personnes.class);
    }
}
