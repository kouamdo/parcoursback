package cmr.notep.business;


import java.util.List;
import java.util.stream.Collectors;

import cmr.notep.dao.MissionEntity;
import cmr.notep.modele.Mission;
import cmr.notep.repository.MissionRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cmr.notep.dao.DaoAccessorService;
import lombok.extern.slf4j.Slf4j;

import static cmr.notep.config.DocumentConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional

public class MissionBusiness {
    private final DaoAccessorService daoAccessorService ;

    public MissionBusiness(DaoAccessorService daoAccessorService) { this.daoAccessorService = daoAccessorService ;}

    public List <Mission> avoirTousMission()
    {
        return daoAccessorService.getRepository(MissionRepository.class).findAll()
                .stream().map(mission -> dozerMapperBean.map(mission,Mission.class))
                .collect(Collectors.toList());
    }

    public Mission avoirMission(String idMission)
    {
        return dozerMapperBean.map(this.daoAccessorService.getRepository(MissionRepository.class).findById(idMission)
                .orElseThrow(()->new RuntimeException("Mission non enregistré")),Mission.class);
    }

    public Mission posterMission (Mission mission){
        return dozerMapperBean.map(
                this.daoAccessorService.getRepository(MissionRepository.class)
                        .save(dozerMapperBean.map(mission, MissionEntity.class)),
                Mission.class
        );
    }
}
