package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Setter
@Getter
@Embeddable
public class RemplirEntityID implements Serializable {

    @Column(name = "roles_id")
    private String roleId;

    @Column(name = "missions_id")
    private String missionId;

}
