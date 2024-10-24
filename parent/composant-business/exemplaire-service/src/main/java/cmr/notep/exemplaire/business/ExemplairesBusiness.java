package cmr.notep.exemplaire.business;

import cmr.notep.api.*;
import cmr.notep.dao.DaoAccessorService;
import cmr.notep.exceptions.ParcoursException;
import cmr.notep.exemplaire.dao.ExemplairesEntity;
import cmr.notep.exemplaire.modele.*;
import cmr.notep.exemplaire.repository.ExemplairesRepository;
import cmr.notep.modele.Documents;
import cmr.notep.modele.Personnes;
import cmr.notep.modele.PrecoMouvements;
import cmr.notep.modele.Validations;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
    public List<Exemplaires> avoirTousExemplaires() throws ParcoursException {
        List<Exemplaires> list = new ArrayList<>();
        for (ExemplairesEntity exemplairesEntity : this.daoAccessorService.getRepository(ExemplairesRepository.class).findAll()) {
            Exemplaires exemplaires = convertirExemplaireInterneEnExemplaire(dozerMapperBean.map(exemplairesEntity, ExemplairesInterne.class));
            list.add(exemplaires);
        }
        return list;
    }
    public ExemplairesInterne avoirExemplaireInterne(String idExemplaire) throws ParcoursException {
        return dozerMapperBean.map(this.daoAccessorService.getRepository(ExemplairesRepository.class)
                .findById(idExemplaire)
                .orElseThrow(()-> new ParcoursException("Attribut introuvable")), ExemplairesInterne.class);
    }
    public Exemplaires avoirExemplaire(String idExemplaire) throws ParcoursException {
        ExemplairesInterne exemplairesInterne = avoirExemplaireInterne(idExemplaire);
        return convertirExemplaireInterneEnExemplaire(exemplairesInterne);
    }

    private Exemplaires convertirExemplaireInterneEnExemplaire(ExemplairesInterne exemplairesInterne) throws ParcoursException {
        Documents document = documentsApi.avoirDocument(exemplairesInterne.getDocumentId());
        Exemplaires exemplaire = Exemplaires.builder().build();
        dozerMapperBean.map(document, exemplaire);

        exemplaire.setId(exemplairesInterne.getId());
        exemplaire.setCode(exemplairesInterne.getCode());
        exemplaire.setCodeBarre(exemplairesInterne.getCodeBarre());
        exemplaire.setIntitule(exemplairesInterne.getTitre());
        exemplaire.setIdExemplairesParents(exemplairesInterne.getIdExemplairesParents());
        exemplaire.setDateCreated(exemplairesInterne.getDateCreation());
        exemplaire.setDateModificated(exemplairesInterne.getDateModification());
        exemplaire.setPersonneBeneficiaire(
                StringUtils.isNotBlank(exemplairesInterne.getPersonneBeneficiaire())?
                        personnesApi.avoirPersonne(exemplairesInterne.getPersonneBeneficiaire()):null);
        exemplaire.setPersonneRattachee(
                StringUtils.isNotBlank(exemplairesInterne.getPersonneRattachee())?
                        personnesApi.avoirPersonne(exemplairesInterne.getPersonneRattachee()):null);
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
        if(CollectionUtils.isEmpty(exemplaireAttributs))
            return new ArrayList<>();
        return exemplaireAttributs.stream().map(exemplaireAttributInterne -> {
            ExemplaireAttributs exemplaireAttribut = null;
            try {
                exemplaireAttribut = ExemplaireAttributs.builder()
                        .valeur(exemplaireAttributInterne.getValeur())
                        .dateCreation(exemplaireAttributInterne.getDateCreation())
                        .dateModification(exemplaireAttributInterne.getDateModification())
                        .attribut(
                                StringUtils.isNotBlank(exemplaireAttributInterne.getAttribut())?
                                    attributsApi.avoirAttribut(exemplaireAttributInterne.getAttribut()):null)
                        .build();
            } catch (ParcoursException e) {
                throw new RuntimeException(e);
            }
            return exemplaireAttribut;
        }).toList();
    }

    private List<Mouvements> convertirListeMouvemntsInterneEnMouvements(List<MouvementsInterne> mouvementsInternes) {
        if(CollectionUtils.isEmpty(mouvementsInternes))
            return new ArrayList<>();
        return mouvementsInternes.stream().map(mouvementInterne -> {
            Mouvements mouvement = null;
            try {
                List<PrecoMouvements> precoMouvementsRespecter = new ArrayList<>();
                if(!CollectionUtils.isEmpty(mouvementInterne.getPrecoMouvementsRespecter()))
                    for (String idPreco : mouvementInterne.getPrecoMouvementsRespecter()) {
                        if(StringUtils.isNotBlank(idPreco))
                            precoMouvementsRespecter.add(precoMouvementsApi.avoirPrecoMouvement(idPreco));
                    }
                List<PrecoMouvements> precoMouvementsVioler = new ArrayList<>();
                if(!CollectionUtils.isEmpty(mouvementInterne.getPrecoMouvementsVioler()))
                    for (String idPrecoMouvement : mouvementInterne.getPrecoMouvementsVioler()) {
                        if(StringUtils.isNotBlank((idPrecoMouvement)))
                            precoMouvementsVioler.add(precoMouvementsApi.avoirPrecoMouvement(idPrecoMouvement));
                    }
                mouvement = Mouvements.builder()
                        .dateCreation(mouvementInterne.getDateCreation())
                        .id(mouvementInterne.getId())
                        .datePeremption(mouvementInterne.getDatePeremption())
                        .description(mouvementInterne.getDescription())
                        .prix(mouvementInterne.getPrix())
                        .quantite(mouvementInterne.getQuantite())
                        .ressource(
                                StringUtils.isNotBlank(mouvementInterne.getRessource())?
                                        ressourcesApi.avoirRessource(mouvementInterne.getRessource()):null)
                        .distributeur(
                                StringUtils.isNotBlank(mouvementInterne.getDistributeur())?
                                        distributeursApi.avoirDistributeur(mouvementInterne.getDistributeur()):null)
                        .precoMouvementsRespecter(precoMouvementsRespecter)
                        .precoMouvementsVioler(precoMouvementsVioler)
                        .build();
            } catch (ParcoursException e) {
                throw new RuntimeException(e);
            }
            return mouvement;
        }).toList();
    }

    private List<PersonnesDestinataires> convertirListePersonneDestinataireInterneEnPersonneDestinataire(ExemplairesInterne exemplairesInterne) {
        if(CollectionUtils.isEmpty(exemplairesInterne.getPersonnesDestinataires()))
            return new ArrayList<>();
        return exemplairesInterne.getPersonnesDestinataires().stream().map(personneDestinataireIntene -> {
            PersonnesDestinataires personneDestinataire = null;
            try {
                personneDestinataire = PersonnesDestinataires.builder()
                                    .dateEnvoi(personneDestinataireIntene.getDateEnvoi())
                                    .methodeEnvoi(personneDestinataireIntene.getMethodeEnvoi())
                                    .personne(
                                            StringUtils.isNotBlank(personneDestinataireIntene.getPersonne())?
                                                personnesApi.avoirPersonne(personneDestinataireIntene.getPersonne()):null)
                                    .build();

            } catch (ParcoursException e) {
                throw new RuntimeException(e);
            }
            return personneDestinataire;
        }).toList();
    }

    private List<OrdreEtats> convertirListeOrdreEtatsInterneEnOrdreEtats(List<OrdreEtatsInterne> ordreEtatsInternes) throws ParcoursException {
        if(CollectionUtils.isEmpty(ordreEtatsInternes))
            return new ArrayList<>();
        return ordreEtatsInternes.stream().map(ordreEtatInterne -> {
            OrdreEtats ordreEtat = null;
            try {
                ordreEtat = OrdreEtats.builder()
                        .id(ordreEtatInterne.getId())
                        .dateCreation(ordreEtatInterne.getDateCreation())
                        .dateModification(ordreEtatInterne.getDateModification())
                        .dateFinVote(ordreEtatInterne.getDateFinVote())
                        .ordre(ordreEtatInterne.getOrdre())
                        .etat(etatsApi.avoirEtat(
                                StringUtils.isNotBlank(ordreEtatInterne.getEtat())?ordreEtatInterne.getEtat():null))
                        .etatsValidations(convertirEtatsValidationsInterneEnEtatsValidations(ordreEtatInterne.getEtatsValidations()))
                        .build();
            } catch (ParcoursException e) {
                throw new RuntimeException(e);
            }
            return ordreEtat;
        }).toList();
    }

    private List<EtatsValidations> convertirEtatsValidationsInterneEnEtatsValidations(List<EtatsValidationsInterne> etatsValidationsInternes) {
        if(CollectionUtils.isEmpty(etatsValidationsInternes))
            return new ArrayList<>();
        return etatsValidationsInternes.stream()
                .filter(etatsValidationsInterne -> StringUtils.isNotBlank(etatsValidationsInterne.getId()))
                .map(etatsValidationsInterne -> {
                    EtatsValidations etatsValidation = null;
                    try {
                        etatsValidation = EtatsValidations.builder()
                                .id(etatsValidationsInterne.getId())
                                .methode(etatsValidationsInterne.getMethode())
                                .personnel(
                                        StringUtils.isNotBlank(etatsValidationsInterne.getPersonnel())?
                                            personnelsApi.avoirPersonnel(etatsValidationsInterne.getPersonnel()):null)
                                .validation(
                                        StringUtils.isNotBlank(etatsValidationsInterne.getValidation())?
                                            validationsApi.avoirValidation(etatsValidationsInterne.getValidation()):null)
                                .build();
                    } catch (ParcoursException e) {
                        throw new RuntimeException(e);
                    }
                    return etatsValidation;
        }).toList();
    }

}
