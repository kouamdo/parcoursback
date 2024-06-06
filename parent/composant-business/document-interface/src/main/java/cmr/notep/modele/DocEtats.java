package cmr.notep.modele;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DocEtats {
    private String id;
    private int ordre;
    private Date dateCreation ;
    private Validations validationsEntity;
    private List<DocEtats> predecesseursDocEtat;
    private Etats etat;
    private Documents document;
}
