package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties({"service"})
@ToString(exclude = {"service"})
@EqualsAndHashCode(exclude = {"service"})
public class Missions {

    private String id ;
    private String libelle ;
    private String description;
    private boolean etat ;
    private Date dateCreation ;
    private Date dateModification ;
    private List<Documents> documents;
    private Services service;
    private List<Remplir> remplirList;
}
