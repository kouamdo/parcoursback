package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;

@Setter
@Getter
public class AssoicierEntityID implements Serializable {
    @Column(name = "attribut_id")
    private String attribut_id ;
    @Column(name = "id_category")
    private String id_category ;

}
