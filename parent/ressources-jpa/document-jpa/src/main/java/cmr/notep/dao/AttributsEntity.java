package cmr.notep.dao;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import cmr.notep.service.AttributServiceImpl;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "attributs")
public class AttributsEntity {
    
    @SuppressWarnings("null")
    public AttributsEntity SaveAttrib(AttributServiceImpl attributServiceImpl) {
        return attributServiceImpl.attributRepo.save(null);
    }

    @SuppressWarnings("null")
    public AttributsEntity SaveAttrib(AttributServiceImpl attributServiceImpl) {
        return SaveAttrib(attributServiceImpl);
    }

    @Id
    @Column(name = "id", nullable = false)
    private String id;

    
    @Column(name = "titre", nullable = false)
    private String titre;

    
    @Column(name = "description")
    private String description;

    @Column(name = "etat")
    private Boolean etat;

    @Column(name = "datecreation")
    private LocalDate datecreation;

    @Column(name = "datemodification")
    private LocalDate datemodification;

    
    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "optionnel")
    private Boolean optionnel;

    
    @Column(name = "valeurpardefaut")
    private String valeurpardefaut;

    @ManyToMany(mappedBy = "attributsEntities")
    @JsonIgnore
    //@Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<DocumentsEntity> documentsEntities;

}