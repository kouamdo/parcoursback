package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties({"service"})
@ToString(exclude = {"service"})
@EqualsAndHashCode(exclude = {"service"})
public class Mission {
    private String id ;
    private String libelle ;
    private String description;
    private boolean etat ;
    private LocalDate datecreation ;
    private LocalDate dateModification ;
    private List<Documents> documents ;
    private Services service ;
}
