package cmr.notep.document;

import cmr.notep.api.IDocumentApi;
import cmr.notep.commun.AbstractIttest;
import cmr.notep.config.ItTestConfig;
import cmr.notep.modele.Attributs;
import cmr.notep.modele.Documents;
import cmr.notep.modele.Types;
import cmr.notep.utile.JsonComparator;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@SpringBootTest
@ContextConfiguration(classes = {ItTestConfig.class})
@Transactional(isolation = Isolation.READ_UNCOMMITTED)
public class DocumentCrudTest extends AbstractIttest {

 List<Documents> documentsList = null;
 String dossier= "data/documents";
 ObjectMapper objectMapper = new ObjectMapper();
@Test
@SneakyThrows
 public void testAvoirTousDocuments() {
   documentsList = documentService.avoirTousDocuments();

   String pathJson = dossier+"/documents_avoirtous";
   documentsList.sort(Comparator.comparing(Documents::getId));

    // Les noms des champs à exclure de la comparaison
    Set<String> fieldsToExclude = new HashSet<>();
    fieldsToExclude.add("id");
    fieldsToExclude.add("dateModification");
    Assertions.assertTrue(JsonComparator.CompareResultWithJson(
            pathJson
            ,objectMapper.writeValueAsString(documentsList)
            ,Documents[].class
            ,fieldsToExclude));
 }

 @Test
 @SneakyThrows
 public void testPosterDocument(){
   Documents document = new Documents();
   document.setId("identifiantTest");
   document.setTitre("TitreTest");
   document.setDescription("DescriptionTest");
   document.setEtat(true);
   Attributs attribut = Attributs.builder().id("1234").etat(true).titre("TAILLE").description("taille").type(Types.Double).build();
   Attributs attribut1 = Attributs.builder().id("3456").etat(true).titre("SEXES").description("SEXE").type(Types.String).build();
   document.setAttributs(List.of(attribut,attribut1));
   Documents document1 = documentService.posterDocument(document);
   documentsList = documentService.avoirTousDocuments();
  // documentsList.sort(Comparator.comparing(Documents::getId));
   String pathJson = dossier+"/documents_avoirtous_post";
   Set<String> fieldsToExclude = new HashSet<>();
   fieldsToExclude.add("id");
   fieldsToExclude.add("dateModification");
   Assertions.assertTrue(JsonComparator.CompareResultWithJson(
           pathJson
           ,objectMapper.writeValueAsString(documentsList)
           ,Documents[].class
           ,fieldsToExclude));
 }

   // @Test
    @SneakyThrows
    public void testPosterDocumentWithMultiThread(){
        Documents document = new Documents();
        document.setId("identifiantTest");
        document.setTitre("TitreTest");
        document.setDescription("DescriptionTest");
        document.setEtat(true);
        Attributs attribut = Attributs.builder().id("1234").etat(true).titre("TAILLE").description("taille").type(Types.Double).build();
        Attributs attribut1 = Attributs.builder().id("3456").etat(true).titre("SEXES").description("SEXE").type(Types.String).build();
        document.setAttributs(List.of(attribut,attribut1));

        Documents document1 = documentService.posterDocument(document);
        documentsList = documentService.avoirTousDocuments();
        // documentsList.sort(Comparator.comparing(Documents::getId));
        String pathJson = dossier+"/documents_avoirtous_post";
        Set<String> fieldsToExclude = new HashSet<>();
        fieldsToExclude.add("id");
        fieldsToExclude.add("dateModification");
        Assertions.assertTrue(JsonComparator.CompareResultWithJson(
                pathJson
                ,objectMapper.writeValueAsString(documentsList)
                ,Documents[].class
                ,fieldsToExclude));
        //ecrire un ajout en thread concurrent avec future et completable future





    }

}
