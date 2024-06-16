package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@PrimaryKeyJoinColumn(name = "personnesmorale_id")
@Table(name = "personnes_morale")
public class PersonnesMoraleEntity extends PersonnesEntity{

    @Column(name = "raisonsociale")
    private String raisonsociale ;

    @Column(name = "code")
    private String code;

}
