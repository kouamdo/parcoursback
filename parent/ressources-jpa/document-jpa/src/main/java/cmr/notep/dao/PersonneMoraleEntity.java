package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Getter
@Setter
@Entity
@Table(name = "personnemorale")
public class PersonneMoraleEntity extends PersonneEntity{

    @Column(name = "raisonsociale")
    private String raisonsociale ;

    @Column(name = "code")
    private String code ;

}
