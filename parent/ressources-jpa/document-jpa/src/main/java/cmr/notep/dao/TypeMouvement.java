package cmr.notep.dao;

public enum TypeMouvement {
    Neutre("Neutre"),
    Ajout("Ajout"),
    Reduire("Reduire");

    private final String typemvt;

    TypeMouvement(String typeMvt) {
        this.typemvt = typeMvt;
    }
}
