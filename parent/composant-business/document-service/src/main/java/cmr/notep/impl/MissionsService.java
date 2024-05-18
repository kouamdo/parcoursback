package cmr.notep.impl;

import cmr.notep.api.IMissionApi;
import cmr.notep.business.MissionBusiness;
import cmr.notep.modele.Mission;
import org.springframework.web.bind.annotation.RestController;
import lombok.NonNull;
import javax.transaction.Transactional;
import java.util.List;
import javax.transaction.Transactional;

@RestController
@Transactional
public class MissionsService implements IMissionApi {

    private final MissionBusiness missionBusiness ;

    public MissionsService(MissionBusiness missionBusiness) {
        this.missionBusiness = missionBusiness;
    }


    @Override
    public Mission avoirMissions(String idMission) {
        return missionBusiness.avoirMission(idMission);
    }

    @Override
    public List<Mission> avoirToutMissions() {
        return missionBusiness.avoirTousMission();
    }

    @Override
    public void supprimerMissions(Mission missions) {

    }

    @Override
    public Mission posterMissions(Mission mission) {
        return missionBusiness.posterMission(mission);
    }

//    @Override
//    public Mission avoirMission(@NonNull String idMission) {
//        return missionBusiness.avoirMission(idMission);
//    }
//
//    @Override
//    public List<Mission> avoirToutAttribut() {
//        return missionBusiness.avoirTousMission();
//    }
//
//    @Override
//    public void supprimerMission(@NonNull Mission missions) {
//
//    }
//
//    @Override
//    public Mission posterMission(@NonNull Mission mission) {
//        return missionBusiness.posterMission(mission);
//    }
}
