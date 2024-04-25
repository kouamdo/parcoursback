package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Builder;

import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Service {
    private String id ;
    private String description;
    private String libelle;
    private Boolean etat;
    private LocalDate datecreation;
    private LocalDate datemodification;
    private String codeuniq;
    private List<Mission> listMission ;
}
