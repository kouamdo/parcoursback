package cmr.notep.modele;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class TicketsFilesAttentes {
    private String id;
    private Boolean etat ;
    private Date dateAffectation;
    private Tickets ticket;
    private FilesAttentes fileAttente;
}
