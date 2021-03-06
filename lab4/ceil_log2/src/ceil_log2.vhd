LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
use ieee.math_real.all;

PACKAGE lab4 IS
    FUNCTION count_leading_zeros(x : UNSIGNED) return UNSIGNED;
    FUNCTION ceil_log2(x : UNSIGNED) return UNSIGNED;
    FUNCTION natural_to_thermometer(x : unsigned) return BIT_VECTOR;
END PACKAGE lab4;

package body lab4 is
    FUNCTION count_leading_zeros(x : UNSIGNED) return UNSIGNED IS
        VARIABLE count : UNSIGNED(x'RANGE) := to_unsigned(0, x'LENGTH);
    BEGIN
        FOR i IN x'RANGE LOOP
            CASE x(i) IS
                WHEN '0'    => count := count + 1;
                WHEN OTHERS => EXIT;
            END CASE;
        END LOOP;
        RETURN count;
    END FUNCTION count_leading_zeros;

    FUNCTION ceil_log2(x : UNSIGNED) return UNSIGNED IS
        -- as it turns out this can be done with a count leading zeros procedure which is
        -- very close to our count leading ones procedure
        VARIABLE temp : UNSIGNED(x'RANGE) := to_unsigned(0, x'LENGTH);
    begin
        IF x = to_unsigned(0, x'LENGTH) THEN
            return to_unsigned(0, x'LENGTH);
        ELSE
            temp := count_leading_zeros(x - to_unsigned(1, x'LENGTH));
            return to_unsigned(x'HIGH, x'LENGTH) - temp + to_unsigned(1, x'LENGTH);
        END IF;
    end FUNCTION ceil_log2;

    FUNCTION natural_to_thermometer(x : UNSIGNED) RETURN BIT_VECTOR IS
        VARIABLE temp : BIT_VECTOR((2**x'LENGTH - 1) DOWNTO 0) := (OTHERS => '0');
    BEGIN
        FOR i IN 0 TO temp'left LOOP
            IF i < x THEN
                temp(i) := '1';
            ELSE
                EXIT;
            END IF;
        END LOOP;
        RETURN temp;
    END FUNCTION natural_to_thermometer;
end lab4;
