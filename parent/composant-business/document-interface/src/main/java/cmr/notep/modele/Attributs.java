package cmr.notep.modele;

import lombok.*;

import java.util.Date;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
@Builder
public class Attributs {
    private String id;
    private String titre;

    private String description;

    private boolean etat;

    private Date dateCreation;

    private Date dateModification;

    private Types type;

}
