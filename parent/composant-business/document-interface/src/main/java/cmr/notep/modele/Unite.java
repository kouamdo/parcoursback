package cmr.notep.modele;

public enum Unite {

    LITRE("Litre"),
    KG("Kg"),
    PACKS("Packs"),
    BOITE("Boite");

    private final String unite;

    Unite(String unite) {
        this.unite = unite;
    }

    public String getUnite() {
        return unite;
    }
}
