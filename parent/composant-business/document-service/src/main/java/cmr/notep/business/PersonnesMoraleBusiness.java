package cmr.notep.business;

import cmr.notep.dao.DaoAccessorService;
import cmr.notep.dao.PersonnesMoralesEntity;
import cmr.notep.dao.PersonnesPhysiquesEntity;
import cmr.notep.modele.PersonnesMorale;
import cmr.notep.modele.PersonnesPhysique;
import cmr.notep.repository.PersonneMoraleRepository;
import cmr.notep.repository.PersonnePhysiqueRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static cmr.notep.config.DocumentConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional
public class PersonnesMoraleBusiness {

    private final DaoAccessorService daoAccessorService;

    public PersonnesMoraleBusiness(DaoAccessorService daoAccessorService) {
        this.daoAccessorService = daoAccessorService;
    }

    public PersonnesMorale avoirPersonneMorale(String id) {
        System.out.println("Recherche de personnes morale");
        Optional<PersonnesMoralesEntity> personneMorale = this.daoAccessorService.getRepository(PersonneMoraleRepository.class)
                .findById(id);
        return personneMorale.isPresent() ? dozerMapperBean.map(personneMorale.get(), PersonnesMorale.class) : null;
    }
}
