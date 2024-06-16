package cmr.notep.modele;

import lombok.Getter;

@Getter
public enum Unite {

    LITRE("Litre"),
    KG("Kg"),
    PACKS("Packs"),
    BOITE("Boite");

    private final String unite;

    Unite(String unite) {
        this.unite = unite;
    }

}
