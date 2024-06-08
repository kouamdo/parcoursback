package cmr.notep.modele;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class Tickets {
    private String id;
    private String codecourt;
}
