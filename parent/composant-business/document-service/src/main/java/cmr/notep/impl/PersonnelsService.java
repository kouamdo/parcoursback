package cmr.notep.impl;

import cmr.notep.api.IPersonnelsApi;
import cmr.notep.modele.Personnels;

import java.util.List;

public class PersonnelsService implements IPersonnelsApi {
    @Override
    public Personnels posterPersonnel(Personnels Personnel) {
        return null;
    }

    @Override
    public Personnels avoirPersonnel(String idPersonnel) {
        return null;
    }

    @Override
    public List<Personnels> avoirTousPersonnels() {
        return List.of();
    }

    @Override
    public Boolean SupprimerPersonnel(Personnels personnel) {
        return null;
    }
}
