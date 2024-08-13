package cmr.notep.business;

import cmr.notep.dao.DaoAccessorService;
import cmr.notep.modele.Distributeurs;
import cmr.notep.modele.PersonnesPhysique;
import cmr.notep.repository.DistributeursRepository;
import cmr.notep.repository.PersonnePhysiqueRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

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
        return dozerMapperBean.map(
                this.daoAccessorService.getRepository(PersonnePhysiqueRepository.class)
                        .findById(id)
                        .orElseThrow(()->new RuntimeException("Distributeurs inexistante")), PersonnesPhysique.class);}

    public List<PersonnesPhysique> avoirListPersonnePhysiquesByelmnt(String value)
    {
        return daoAccessorService.getRepository(PersonnePhysiqueRepository.class).findByNomOrByPrenom(value)
                .stream().map(cat ->dozerMapperBean.map(cat, PersonnesPhysique.class))
                .collect(Collectors.toList());
    }
}