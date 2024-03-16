package cmr.notep.service;

import java.util.Optional;

import cmr.notep.dao.AttributsEntity;

public interface AttributService {

    public Optional<AttributsEntity> GetAttrib(String Id_attribut);
    public AttributsEntity SetAttrib (String Id_attribut , AttributsEntity attribut);
    public AttributsEntity SaveAttrib(AttributsEntity attribut);
    public void DeleteAttrib(String id);
}
