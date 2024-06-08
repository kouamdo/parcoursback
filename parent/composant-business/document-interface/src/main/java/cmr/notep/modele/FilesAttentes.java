package cmr.notep.modele;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class FilesAttentes {
    private String id;
    private Date dateCreation;
    private Boolean etat ;
    private Services service;
}
