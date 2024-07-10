package cmr.notep.modele;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties({"ticket"})
@ToString(exclude = {"ticket"})
@EqualsAndHashCode(exclude = {"ticket"})
public class TicketsFilesAttentes {
    private String id;
    private Boolean etat ;
    private Date dateAffectation;
    private Tickets ticket;
    private FilesAttentes fileAttente;
}
