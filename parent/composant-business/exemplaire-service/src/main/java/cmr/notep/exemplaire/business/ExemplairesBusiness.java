package cmr.notep.exemplaire.business;

import cmr.notep.api.*;
import cmr.notep.dao.DaoAccessorService;
import cmr.notep.exceptions.ParcoursException;
import cmr.notep.exemplaire.modele.*;
import cmr.notep.exemplaire.repository.ExemplairesRepository;
import cmr.notep.modele.Documents;
import cmr.notep.modele.Personnes;
import cmr.notep.modele.Validations;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static cmr.notep.exemplaire.config.ExemplaireConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional
public class ExemplairesBusiness {
    private final DaoAccessorService daoAccessorService ;
    private final IDocumentsApi documentsApi;
    private final IPersonnesApi personnesApi;
    private final IAttributsApi attributsApi;
    private final IDistributeursApi distributeursApi;
    private final IEtatsApi etatsApi;
    private final IValidationsApi validationsApi;
    private final IRessourcesApi ressourcesApi;
    private final IPrecoMouvementsApi precoMouvementsApi;
    private final IPersonnelsApi personnelsApi;

    public ExemplairesBusiness(DaoAccessorService daoAccessorService, IDocumentsApi documentsApi, IPersonnesApi personnesApi, IAttributsApi attributsApi, IDistributeursApi distributeursApi, IEtatsApi etatsApi, IValidationsApi validationsApi, IRessourcesApi ressourcesApi, IPrecoMouvementsApi precoMouvementsApi, IPersonnelsApi personnelsApi) {
        this.daoAccessorService = daoAccessorService;
        this.documentsApi = documentsApi;
        this.personnesApi = personnesApi;
        this.attributsApi = attributsApi;
        this.distributeursApi = distributeursApi;
        this.etatsApi = etatsApi;
        this.validationsApi = validationsApi;
        this.ressourcesApi = ressourcesApi;
        this.precoMouvementsApi = precoMouvementsApi;
        this.personnelsApi = personnelsApi;
    }
    public ExemplairesInterne avoirExemplaireInterne(String idExemplaire) {
        return dozerMapperBean.map(this.daoAccessorService.getRepository(ExemplairesRepository.class)
                .findById(idExemplaire)
                .orElseThrow(()-> new RuntimeException("Attribut introuvable")), ExemplairesInterne.class);
    }
    public Exemplaires avoirExemplaire(String idExemplaire) {
        ExemplairesInterne exemplairesInterne = avoirExemplaireInterne(idExemplaire);
        try {
            return convertirExemplaireInterneEnExemplaire(exemplairesInterne);
        } catch (ParcoursException e) {
            throw new RuntimeException(e);
        }
    }

    private Exemplaires convertirExemplaireInterneEnExemplaire(ExemplairesInterne exemplairesInterne) throws ParcoursException {
        Documents document = documentsApi.avoirDocument(exemplairesInterne.getDocumentId());
        Exemplaires exemplaire = (Exemplaires) document;

        exemplaire.setId(exemplairesInterne.getId());
        exemplaire.setCode(exemplairesInterne.getCode());
        exemplaire.setCodeBarre(exemplairesInterne.getCodeBarre());
        exemplaire.setTitre(exemplairesInterne.getTitre());
        exemplaire.setIdExemplairesParents(exemplairesInterne.getIdExemplairesParents());
        exemplaire.setDateCreation(exemplairesInterne.getDateCreation());
        exemplaire.setDateModification(exemplairesInterne.getDateModification());
        exemplaire.setPersonneBeneficiaire(personnesApi.avoirPersonne(exemplairesInterne.getPersonneBeneficiaire()));
        exemplaire.setPersonneRattachee(personnesApi.avoirPersonne(exemplairesInterne.getPersonneRattachee()));
        List<OrdreEtats> ordreEtatsList = convertirListeOrdreEtatsInterneEnOrdreEtats(exemplairesInterne.getOrdreEtats());
        exemplaire.setOrdreEtats(ordreEtatsList);
        List<Mouvements> mouvements = convertirListeMouvemntsInterneEnMouvements(exemplairesInterne.getMouvements());
        exemplaire.setMouvements(mouvements);
        List<PersonnesDestinataires> personnesDestinataires = convertirListePersonneDestinataireInterneEnPersonneDestinataire(exemplairesInterne);
        exemplaire.setPersonnesDestinataires(personnesDestinataires);
        List<ExemplaireAttributs> exemplaireAttributs = convertirListExemplaireAttributsInterneEnExemplaireAttributs(exemplairesInterne.getExemplaireAttributs());
        exemplaire.setExemplaireAttributs(exemplaireAttributs);

        return exemplaire;
    }

    private List<ExemplaireAttributs> convertirListExemplaireAttributsInterneEnExemplaireAttributs(List<ExemplaireAttributsInterne> exemplaireAttributs) {
        return exemplaireAttributs.stream().map(exemplaireAttributInterne -> {
            ExemplaireAttributs exemplaireAttribut = null;
            try {
                exemplaireAttribut = ExemplaireAttributs.builder()
                        .valeur(exemplaireAttributInterne.getValeur())
                        .dateCreation(exemplaireAttributInterne.getDateCreation())
                        .dateModification(exemplaireAttributInterne.getDateModification())
                        .attribut(attributsApi.avoirAttribut(exemplaireAttributInterne.getAttribut()))
                        .build();
            } catch (ParcoursException e) {
                throw new RuntimeException(e);
            }
            return exemplaireAttribut;
        }).toList();
    }

    private List<Mouvements> convertirListeMouvemntsInterneEnMouvements(List<MouvementsInterne> mouvementsInternes) {
        return mouvementsInternes.stream().map(mouvementInterne -> {
            Mouvements mouvement = null;
            try {
                mouvement = Mouvements.builder()
                        .dateCreation(mouvementInterne.getDateCreation())
                        .id(mouvementInterne.getId())
                        .datePeremption(mouvementInterne.getDatePeremption())
                        .description(mouvementInterne.getDescription())
                        .prix(mouvementInterne.getPrix())
                        .quantite(mouvementInterne.getQuantite())
                        .ressource(ressourcesApi.avoirRessource(mouvementInterne.getRessource()))
                        .distributeur(distributeursApi.avoirDistributeur(mouvementInterne.getDistributeur()))
                        .precoMouvementsRespecter(mouvementInterne.getPrecoMouvementsRespecter().stream().map(idPrecoMouvement -> {
                            try {
                                return precoMouvementsApi.avoirPrecoMouvement(idPrecoMouvement);
                            } catch (ParcoursException e) {
                                throw new RuntimeException(e);
                            }
                        }).toList())
                        .precoMouvementsVioler(mouvementInterne.getPrecoMouvementsVioler().stream().map(idPrecoMouvement -> {
                            try {
                                return precoMouvementsApi.avoirPrecoMouvement(idPrecoMouvement);
                            } catch (ParcoursException e) {
                                throw new RuntimeException(e);
                            }
                        }).toList())
                        .build();
            } catch (ParcoursException e) {
                throw new RuntimeException(e);
            }
            return mouvement;
        }).toList();
    }

    private List<PersonnesDestinataires> convertirListePersonneDestinataireInterneEnPersonneDestinataire(ExemplairesInterne exemplairesInterne) {
        return exemplairesInterne.getPersonnesDestinataires().stream().map(personneDestinataireIntene -> {
            PersonnesDestinataires personneDestinataire = null;
            try {
                personneDestinataire = PersonnesDestinataires.builder()
                                    .dateEnvoi(personneDestinataireIntene.getDateEnvoi())
                                    .methodeEnvoi(personneDestinataireIntene.getMethodeEnvoi())
                                    .personne(personnesApi.avoirPersonne(personneDestinataireIntene.getPersonne()))
                                    .build();

            } catch (ParcoursException e) {
                throw new RuntimeException(e);
            }
            return personneDestinataire;
        }).toList();
    }

    private List<OrdreEtats> convertirListeOrdreEtatsInterneEnOrdreEtats(List<OrdreEtatsInterne> ordreEtatsInternes) throws ParcoursException {
        return ordreEtatsInternes.stream().map(ordreEtatInterne -> {
            OrdreEtats ordreEtat = null;
            try {
                ordreEtat = OrdreEtats.builder()
                        .id(ordreEtatInterne.getId())
                        .dateCreation(ordreEtatInterne.getDateCreation())
                        .dateModification(ordreEtatInterne.getDateModification())
                        .dateFinVote(ordreEtatInterne.getDateFinVote())
                        .ordre(ordreEtatInterne.getOrdre())
                        .etat(etatsApi.avoirEtat(ordreEtatInterne.getEtat()))
                        .etatsValidations(convertirEtatsValidationsInterneEnEtatsValidations(ordreEtatInterne.getEtatsValidations()))
                        .build();
            } catch (ParcoursException e) {
                throw new RuntimeException(e);
            }
            return ordreEtat;
        }).toList();
    }

    private List<EtatsValidations> convertirEtatsValidationsInterneEnEtatsValidations(List<EtatsValidationsInterne> etatsValidationsInternes) {
        return etatsValidationsInternes.stream().map(etatsValidationsInterne -> {
            EtatsValidations etatsValidation = null;
            try {
                etatsValidation = EtatsValidations.builder()
                        .id(etatsValidationsInterne.getId())
                        .methode(etatsValidationsInterne.getMethode())
                        .personnel(personnelsApi.avoirPersonnel(etatsValidationsInterne.getPersonnel()))
                        .validation(validationsApi.avoirValidation(etatsValidationsInterne.getValidation()))
                        .build();
            } catch (ParcoursException e) {
                throw new RuntimeException(e);
            }
            return etatsValidation;
        }).toList();
    }

}
