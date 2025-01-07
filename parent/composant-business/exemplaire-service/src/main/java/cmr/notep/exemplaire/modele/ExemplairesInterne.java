package cmr.notep.exemplaire.modele;

import cmr.notep.modele.Documents;
import cmr.notep.modele.Personnes;
import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class ExemplairesInterne  {
    private String id;
    private String code;
    private String codeBarre;
    private String titre;
    private String documentId;
    //liste des id des exemplaires qui ont servi à la creation de cet exemplaire
    private List<String> idExemplairesParents;
    private Date dateCreation;
    private Date dateModification;
    private String personneBeneficiaire;
    private String personneRattachee;
    private List<OrdreEtatsInterne> ordreEtats;
    private List<MouvementsInterne> mouvements;
    private List<PersonnesDestinatairesInterne> personnesDestinataires;
    private List<ExemplaireAttributsInterne> exemplaireAttributs;
}
