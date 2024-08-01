package cmr.notep.business;

import cmr.notep.dao.DaoAccessorService;
import cmr.notep.dao.PersonnesPhysiquesEntity;
import cmr.notep.modele.PersonnesPhysique;
import cmr.notep.repository.PersonnePhysiqueRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static cmr.notep.config.DocumentConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional
public class PersonnesPhysiqueBusiness {

    private final DaoAccessorService daoAccessorService;

    public PersonnesPhysiqueBusiness(DaoAccessorService daoAccessorService) {
        this.daoAccessorService = daoAccessorService;
    }

    public PersonnesPhysique avoirPersonnePhysique(String id) {
        System.out.println("Recherche de personnes physique");
        Optional<PersonnesPhysiquesEntity> personnePhysique = this.daoAccessorService.getRepository(PersonnePhysiqueRepository.class)
                .findById(id);
        return personnePhysique.isPresent() ? dozerMapperBean.map(personnePhysique.get(), PersonnesPhysique.class) : null;
    }

}
