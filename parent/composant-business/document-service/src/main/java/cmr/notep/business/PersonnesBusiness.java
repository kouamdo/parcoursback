package cmr.notep.business;

import cmr.notep.dao.DaoAccessorService;
import cmr.notep.dao.PersonnesEntity;
import cmr.notep.modele.*;
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

    private final DistributeursBusiness distributeursBusiness ;
    private final PersonnesPhysiqueBusiness personnesPhysiqueBusiness;
    private final PersonnesMoraleBusiness personnesMoraleBusiness;

    public PersonnesBusiness(
            DaoAccessorService daoAccessorService ,
            DistributeursBusiness distributeursBusiness,
            PersonnesPhysiqueBusiness personnesPhysiqueBusiness,
            PersonnesMoraleBusiness personnesMoraleBusiness)
    {

        this.daoAccessorService = daoAccessorService;
        this.distributeursBusiness = distributeursBusiness;
        this.personnesPhysiqueBusiness = personnesPhysiqueBusiness;
        this.personnesMoraleBusiness = personnesMoraleBusiness;
    }

    public Personnes avoirPersonne(String id) {
        System.out.println("Recherche de personnes");
        return dozerMapperBean.map(
                this.daoAccessorService.getRepository(PersonnesRepository.class)
                        .findById(id)
                        .orElseThrow(()->new RuntimeException("Personne inexistante")), Personnes.class);
    }

    public MacroPersonnes avoirPersonneType(String id)
    {
       Distributeurs indexdistributeurs = this.distributeursBusiness.avoirDistributeur(id) ;
       PersonnesMorale indexpersonnemorale = this.personnesMoraleBusiness.avoirPersonneMorale(id);
       PersonnesPhysique indexpersonnephysique = this.personnesPhysiqueBusiness.avoirPersonnePhysique(id);

        if (indexdistributeurs != null)
        {
            return new MacroPersonnes("Distributeurs" , indexdistributeurs);
        } else if (indexpersonnemorale != null) {
            return new MacroPersonnes("Personne Morale" , indexpersonnemorale);
        }
        else if (indexpersonnephysique != null)
            return new MacroPersonnes("Personnes Physique" , indexpersonnephysique);

        else
            return new MacroPersonnes("Personnes" , null);

    }

    public List<Personnes> avoirToutPersonnes() {
        return daoAccessorService.getRepository(PersonnesRepository.class).findAll()
                .stream().map(personne ->dozerMapperBean.map(personne, Personnes.class))
                .collect(Collectors.toList());
    }

    public void supprimerPersonne(Personnes Personnes)
    {
        daoAccessorService.getRepository(PersonnesRepository.class)
                .deleteById(String.valueOf(Personnes.getId()));
    }

    public Personnes posterPersonne(Personnes Personnes) {
        return dozerMapperBean.map( this.daoAccessorService.getRepository(PersonnesRepository.class)
                .save(dozerMapperBean.map(Personnes, PersonnesEntity.class)), Personnes.class);
    }
}
