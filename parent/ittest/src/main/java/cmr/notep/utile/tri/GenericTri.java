package cmr.notep.utile.tri;

import cmr.notep.modele.Documents;
import cmr.notep.utile.tri.modele.DefautTri;
import cmr.notep.utile.tri.modele.DocumentsTri;

import java.util.List;

public class GenericTri  {

    public static IGenericTri getSort(Object o) {
        if(o instanceof Documents[]){
            return  new DocumentsTri();
        }
        else {
            return new DefautTri();
        }
    }
}
