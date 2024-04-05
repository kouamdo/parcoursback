package cmr.notep.utile;

import cmr.notep.utile.tri.GenericTri;
import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import difflib.DiffUtils;
import difflib.Patch;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.stream.Collectors;

public class JsonComparator {

    public static final String SRC_TEST_RESOURCES = "src/test/resources/";
    public static final String STR_DELIMITATEUR = "\"";

    public static boolean CompareResultWithJson(String pathJson, String resultObtenu, Class clazz, Set<String> fieldsToExclude) throws IOException {
        try {
            String urlJSonAttendu = SRC_TEST_RESOURCES.concat(pathJson).concat(".json");
            //ordonner les éléments à comparer puis exclure les champs spécifiés
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode objetResultObtenu =  exclureChamps(objectMapper.writeValueAsString(
                    ordonnerElements(objectMapper.readValue(resultObtenu, clazz)))
                    , fieldsToExclude);
            JsonNode objetResultAttendu =  exclureChamps(objectMapper.writeValueAsString(
                    ordonnerElements(objectMapper.readValue(new File(urlJSonAttendu), clazz)))
                    , fieldsToExclude);

            // Comparez les nodes Json en string et génération du patch
            boolean areEqual = compareJsonNode(objetResultAttendu, objetResultObtenu,pathJson, urlJSonAttendu,fieldsToExclude);

            if (areEqual) {
                System.out.println("Les fichiers JSON sont identiques.");
            } else {
                System.out.println("Les fichiers JSON sont différents.");
            }
            return areEqual;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    //methode qui transforme un objet en jsonNode
    private static JsonNode transformeElements(Object objet) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.readTree(objectMapper.writeValueAsString(objet));
    }

    private static Object ordonnerElements(Object objet) {
        return GenericTri.getSort(objet).sort(objet);
    }

    private static JsonNode exclureChamps(String json, Set<String> fieldsToExclude) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(json);
        replaceFields(jsonNode, fieldsToExclude);
        return jsonNode;
    }

    public static boolean compareJsonNode(JsonNode donneesAttendues, JsonNode resultObtenu,  String pathJson, String urlJSonAttendu,Set<String> fieldsToExclude) throws Exception {
        //transformer les données JsonNode en List de string
        List<String> donneesAttenduesList = donneesAttendues.toPrettyString().lines().toList();
        List<String> resultObtenuList = resultObtenu.toPrettyString().lines().toList();
        ObjectMapper    objectMapper = new ObjectMapper();
        //sauvegarde du fichier json
        String resultObtenuChemin = SRC_TEST_RESOURCES.concat(pathJson).concat("_obtenu.json");
        //ecrireStringDansunfichier(resultObtenu, "_obtenu.json", pathJson, objectMapper);
        ecrireStringDansunfichier(donneesAttendues, ".json", pathJson, objectMapper);

        //comparer les deux listes et creer un patch
        Patch<String> patch = DiffUtils.diff(donneesAttenduesList, resultObtenuList);
        //Generer le fichier patch depuis l'ojet patch
        List<String> patchList = DiffUtils.generateUnifiedDiff(urlJSonAttendu, urlJSonAttendu, donneesAttenduesList, patch, 0);
        ecrireDiffDansUnFichier(pathJson, fieldsToExclude, patchList);
        return patchList.size() == 0;
    }

    private static void ecrireStringDansunfichier(JsonNode donnee, String extension,String pathJson, ObjectMapper objectMapper) throws IOException {
        String resultObtenuChemin = SRC_TEST_RESOURCES.concat(pathJson).concat(extension);
        //sauvegarde du fichier json obtenu
        objectMapper.writer(new DefaultPrettyPrinter()).withRootValueSeparator("\n").writeValue(new File(resultObtenuChemin), donnee);
        try (FileWriter fileWriter = new FileWriter(resultObtenuChemin, true)) {
            fileWriter.write("\n");
        }
    }

    private static void ecrireDiffDansUnFichier(String pathJson, Set<String> fieldsToExclude, List<String> patchList) throws IOException {
        String patchChemin = SRC_TEST_RESOURCES.concat(pathJson).concat(".patch");
        String patchString = patchList.stream().collect(Collectors.joining("\n"));
        //sauvegarde du patch dans un fichier
        Files.write(Paths.get(patchChemin), patchString.getBytes());
    }

    private static void ecrireDiffDansUnFichierEnExcluant(String pathJson, Set<String> fieldsToExclude, List<String> patchList) throws IOException {
        String patchChemin = SRC_TEST_RESOURCES.concat(pathJson).concat(".patch");
        String patchString = patchList.stream().filter(x -> {
           AtomicBoolean isExcluded = new AtomicBoolean(false);
            fieldsToExclude.forEach(y -> {
                StringBuilder sb = new StringBuilder(STR_DELIMITATEUR);
                sb.append(y).append(STR_DELIMITATEUR);
                if (x.contains(sb.toString())) {
                    isExcluded.set(true);
                }
            });
            if (isExcluded.get()) {
                return false;
            } else {
                return true;
        }
        } ).collect(Collectors.joining("\n"));
        //sauvegarde du patch dans un fichier
        Files.write(Paths.get(patchChemin), patchString.getBytes());
    }

    //remplacer dans un jsonNode les champs à exclure par null
    public static void replaceFields(JsonNode node, Set<String> fieldsToExclude) {
        if (node.isObject()) {
            Iterator<String> fieldNames = node.fieldNames();
            while (fieldNames.hasNext()) {
                String fieldName = fieldNames.next();
                if (fieldsToExclude.contains(fieldName)) {
                    ((ObjectNode) node).put(fieldName, (String) null);
                }
                else {
                    replaceFields(node.get(fieldName), fieldsToExclude);
                }
            }
        } else if (node.isArray()) {
            for (JsonNode arrayNode : node) {
                replaceFields(arrayNode, fieldsToExclude);
            }
        }
    }

    public static void removeFields(JsonNode node, Set<String> fieldsToExclude) {
        if (node.isObject()) {
            Iterator<String> fieldNames = node.fieldNames();
            List<String> fieldsToRemove = new ArrayList<>();

            while (fieldNames.hasNext()) {
                String fieldName = fieldNames.next();
                if (fieldsToExclude.contains(fieldName)) {
                    fieldsToRemove.add(fieldName);
                } else {
                    removeFields(node.get(fieldName), fieldsToExclude);
                }
            }

            for (String fieldName : fieldsToRemove) {
                ((ObjectNode) node).remove(fieldName);
            }
        } else if (node.isArray()) {
            List<JsonNode> nodesToRemove = new ArrayList<>();

            for (JsonNode arrayNode : node) {
                removeFields(arrayNode, fieldsToExclude);
            }
        }
    }

}

