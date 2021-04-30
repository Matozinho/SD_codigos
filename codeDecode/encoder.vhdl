entity encoder is
  port(
    c    : in bit_vector(4 downto 0);
    erro : out bit;
    s    : out bit_vector(4 downto 0)
  );

end entity;

architecture code of encoder is
begin

  s(4) <= not c(4) and (c(0) or c(1) or c(2) or c(3));
  s(3) <= (c(3) and (c(0) or c(1) or c(2))) or (not c(0) and not c(1) and not c(2) and not c(3));
  s(2) <= (c(2) and (c(0) or c(1))) or (not c(2) and not c(1) and not c(0));
  s(1) <= c(0) xnor c(1);
  s(0) <= not c(0);
  
  erro <= '1' when c = "10000" else '0';

end architecture;
