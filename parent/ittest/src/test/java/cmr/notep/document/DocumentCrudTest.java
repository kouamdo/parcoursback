package cmr.notep.document;

import cmr.notep.api.IDocumentApi;
import cmr.notep.commun.AbstractIttest;
import cmr.notep.config.ItTestConfig;
import cmr.notep.modele.Documents;
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
            this.getClass().getClassLoader().getResource(pathJson.concat(".json"))
            ,pathJson
            ,objectMapper.writeValueAsString(documentsList)
            ,Documents[].class
            ,fieldsToExclude));
 }



}
