package cmr.notep.dao;

public enum typeMvt {
    Neutre("Neutre"),
    Ajout("Ajout"),
    Reduire("Reduire");

    private final String typemvt;

    typeMvt(String typeMvt) {
        this.typemvt = typeMvt;
    }
}
