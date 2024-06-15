package cmr.notep.modele;

public enum Types {
    Float("Float"),
    Int("Int"),
    String("String"),
    Double("Double"),
    Boolean("Boolean"),
    Date("Date");


    private final String type;

    Types(String Type) {
        this.type = Type;
    }

    public String getType() {
        return this.type;
    }
}
