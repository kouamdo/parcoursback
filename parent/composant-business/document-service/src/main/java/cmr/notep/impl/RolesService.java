package cmr.notep.impl;

import cmr.notep.api.IRolesApi;
import cmr.notep.modele.Roles;

import java.util.List;

public class RolesService implements IRolesApi {
    @Override
    public Roles posterRole(Roles Role) {
        return null;
    }

    @Override
    public Roles avoirRole(String idRole) {
        return null;
    }

    @Override
    public List<Roles> avoirTousRoles() {
        return List.of();
    }

    @Override
    public Boolean SupprimerRole(Roles Role) {
        return null;
    }
}
