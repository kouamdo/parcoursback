package cmr.notep.utile;

import cmr.notep.utile.tri.GenericTri;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.github.fge.jsonpatch.JsonPatch;
import com.github.fge.jsonpatch.diff.JsonDiff;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.*;

public class JsonComparator {
    public static boolean CompareResultWithJson(URL urlJSonAttendu,String pathJson, String resultObtenu, Class clazz, Set<String> fieldsToExclude) throws IOException {
        try {

            //ordonner les éléments à comparer
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode objetResultObtenu =  exclureChamps(objectMapper.writeValueAsString(
                    OrdonnerElements(objectMapper.readValue(resultObtenu, clazz)))
                    , fieldsToExclude);
            JsonNode objetResultAttendu =  exclureChamps(objectMapper.writeValueAsString(
                    OrdonnerElements(objectMapper.readValue(urlJSonAttendu, clazz)))
                    , fieldsToExclude);


            // Comparez les fichiers JSON en excluant les champs spécifiés
            boolean areEqual = compareJsonNode(objetResultAttendu, objetResultObtenu,pathJson);

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

    private static Object OrdonnerElements(Object objet) {
        return GenericTri.getSort(objet).sort(objet);
    }

    private static JsonNode exclureChamps(String json, Set<String> fieldsToExclude) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(json);
        removeFields(jsonNode, fieldsToExclude);
        return jsonNode;
    }

    public static boolean compareJsonNode(JsonNode donneesAttendues, JsonNode resultObtenu,  String pathJson) throws Exception {

        //Calculer la différence entre les deux fichiers JSON
        JsonNode diffResultat = JsonDiff.asJson(donneesAttendues, resultObtenu);
        //céation du patch
        JsonPatch patch = JsonPatch.fromJson(diffResultat);
        //sauvegarde du patch dans un fichier
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.writeValue(new File("src/test/resources/".concat(pathJson).concat(".jsonpatchc")), patch);
         return diffResultat.size() == 0;
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

