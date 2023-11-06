package cmr.notep.document;

import org.springframework.util.FileSystemUtils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class CompareFile {
    //comparer un fichier json avec un objet java
    public void compareJsonFileWithJavaObject() throws IOException {
        //ecrire un code qui lit un fichier json
        String json = new String(Files.readAllBytes(Paths.get("src/test/resources/Document.json")));

        //comparer un fichier json avec un objet java
       // assertThat(json, sameJSONAs(documentsList));
    }
}
