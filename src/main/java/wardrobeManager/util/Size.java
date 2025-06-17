package wardrobeManager.util;

public enum Size {
    XS,
    S,
    M,
    L,
    XL,
    XXL,
    XXXL,
    ONE_SIZE,
    CUSTOM;

    public static Size fromString(String size) {
        try {
            return Size.valueOf(size.toUpperCase());
        } catch (IllegalArgumentException e) {
            return CUSTOM; // Default to CUSTOM if the size is not recognized
        }
    }
}
