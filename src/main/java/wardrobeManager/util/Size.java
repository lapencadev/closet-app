package wardrobeManager.util;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor(force = true)
@Getter
public enum Size {
    XS, S, M, L, XL, XXL, XXXL,
    SIZE_32(32), SIZE_34(34), SIZE_36(36), SIZE_38(38), SIZE_40(40),
    SIZE_42(42), SIZE_44(44), SIZE_46(46), SIZE_48(48), SIZE_50(50),
    SIZE_52(52), SIZE_54(54), SIZE_56(56), SIZE_58(58), SIZE_60(60),
    ONE_SIZE, CUSTOM;

    private final Integer numericValue;

    public static Size fromString(String size) {
        try {
            return Size.valueOf(size.toUpperCase());
        } catch (IllegalArgumentException e) {
            for (Size s : values()) {
                if (s.numericValue != null && s.numericValue.toString().equals(size)) {
                    return s;
                }
            }
            return CUSTOM;
        }
    }
}
