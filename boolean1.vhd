LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY boolean1 IS
  PORT(
    a, b, c, d: IN std_logic;
    x:          OUT std_logic);
  END boolean1;
  
  ARCHITECTURE arc OF boolean1 IS
    BEGIN
      x<= (a AND b) or (c AND d);
    END arc;
