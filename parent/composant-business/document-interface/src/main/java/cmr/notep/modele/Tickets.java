package cmr.notep.modele;

import lombok.*;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class Tickets {
    private String id;
    private String codecourt;
    private List<TicketsFilesAttentes> ticketsfilesattentes;
}
