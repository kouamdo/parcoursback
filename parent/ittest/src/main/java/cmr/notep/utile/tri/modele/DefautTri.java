package cmr.notep.utile.tri.modele;

import cmr.notep.utile.tri.IGenericTri;

public class DefautTri implements IGenericTri<Object> {
    @Override
    public Object sort(Object o) {
        return o;
    }
}
