package cmr.notep.service;


import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import cmr.notep.dao.AttributsEntity;
import cmr.notep.repository.AttributsRepository;

@Service
@Transactional
public class AttributServiceImpl implements AttributService {

    private AttributsRepository attributRepo ;

    public AttributServiceImpl(AttributsRepository attributRepo) {
        this.attributRepo = attributRepo;
    }

    @SuppressWarnings("null")
    @Override
    public AttributsEntity SaveAttrib(AttributsEntity attribut) {
        // TODO Auto-generated method stub
        return this.attributRepo.save(attribut);
    }

    @SuppressWarnings("null")
    @Override
    public Optional<AttributsEntity> GetAttrib(String Id_attribut) {
        // TODO Auto-generated method stub
        return this.attributRepo.findById(Id_attribut);
    }

    @SuppressWarnings("null")
    @Override
    public AttributsEntity SetAttrib(String Id_attribut, AttributsEntity attribut) {
        // TODO Auto-generated method stub
        this.attributRepo.deleteById(Id_attribut);
        return this.attributRepo.save(attribut);
    }
   
    @Override
    public String GetTitre(String Id_attribut) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'GetTitre'");
    }

    @Override
    public String SetTitre(String Id_attribut, String newTitre) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'SetTitre'");
    }

    @Override
    public String toString() {
        return "AttributServiceImpl [attributRepo=" + attributRepo + "]";
    }

    @Override
    public String GetDescription(String Id_attribut) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'GetDescription'");
    }

    @Override
    public String SetDescription(String Id_attribut, String newDescript) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'SetDescription'");
    }
}
